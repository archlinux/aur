# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lua-lunacolors-git
pkgver=r14.5a59d0f
pkgrel=1
pkgdesc="ANSI colors library for Hilbish"
arch=('any')
url="https://github.com/rosettea/lunacolors"
license=('BSD')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## sammy (TorchedSammy)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 init.lua -t "$pkgdir/usr/share/hilbish/libs/lunacolors/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
