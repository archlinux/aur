# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=brainfuck-interp
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="a brainfuck interpreter written in rust"
arch=('any')
license=("GPL")
groups=()
depends=("rust")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/brainfuck/-/archive/master/brainfuck-master.tar.gz")
noextract=()
sha256sums=("75491f1acdb3d8356d9666f1d6d0ed9ef7f80cb10976ca8564342e35a0a8f212")
validpgpkeys=()

build() {
	cd brainfuck-master
	cargo build --release
}

check() {
	cd brainfuck-master
	cargo check
}

package() {
	cd brainfuck-master
	mkdir -p "$pkgdir"/usr/bin
	cargo build --release
	mv target/release/brainfuck "$pkgdir"/usr/bin/brainfuck
}
