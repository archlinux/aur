# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nordic-wallpapers-git
pkgver=r50.700ec61
pkgrel=1
pkgdesc="Wallpaper collection using the Nord color palette"
arch=('any')
url="https://github.com/linuxdotexe/nordic-wallpapers"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 wallpapers/* -t "$pkgdir/usr/share/backgrounds/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

