# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lua-succulent-git
pkgver=r7.96dc95c
pkgrel=2
pkgdesc="Lua functions and utilities for Hilbish"
arch=('any')
url="https://github.com/rosettea/succulent"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')
# validpgpkeys=('098F50DFBCEEC71A4EAB6DA450EE40A2809851F5')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 init.lua -t "$pkgdir/usr/share/hilbish/libs/succulent/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
