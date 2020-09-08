# Maintainer: James Milne <james.milne at protonmail dot com>

pkgname=luaj
pkgver=0.13.0
pkgrel=3
epoch=
pkgdesc="A flavour of Lua. A reworking and rewriting of the Lua runtime to create a new language."
arch=(x86_64)
url="https://git.sr.ht/~shakna/luaj"
license=('custom:3-clause BSD')
groups=('devel')
depends=('lua53')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://git.sr.ht/~shakna/luaj")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git pull origin "$pkgver"
	git checkout "$pkgver"
}

build() {
	cd "$pkgname"
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr/bin" install
}
