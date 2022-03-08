# Maintainer: cod_er <itzz@duck.com>
pkgname=material-linux-wallpapers
pkgver=1
pkgrel=1
pkgdesc="Win11 & andrio12 based material style wallpapers"
arch=('any')
url="https://gitlab.com/cod_er/material-wallpapers"
license=('GPL')
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
