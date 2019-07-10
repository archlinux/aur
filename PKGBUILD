# Maintainer: James Milne <s4b3r6@gmail.com>
pkgname=evjl
pkgver=v0.1.0
pkgrel=1
epoch=1
pkgdesc="A low-level programming language, currently in 'alpha' levels of design."
arch=(x86_64)
url="https://git.sr.ht/~shakna/evjl"
license=('custom:3-clause BSD')
groups=('devel')
depends=('tcc')
makedepends=('xxd')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://git.sr.ht/~shakna/evjl")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git checkout 'v0.1.0'
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
