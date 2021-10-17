# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lua-lunacolors-git
pkgver=r11.d200fca
pkgrel=1
pkgdesc="ANSI colors library for Hilbish"
arch=('any')
url="https://github.com/hilbis/lunacolors"
license=('BSD')
depends=('hilbish')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 init.lua -t "$pkgdir/usr/share/hilbish/libs/lunacolors/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
