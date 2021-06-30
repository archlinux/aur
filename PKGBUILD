# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=brainfuck-interp
pkgver=1.0.1
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
sha256sums=("2d6685fa12105de62249bb69d419a4f6b7946524d60688c7acf0711b7b9bd57d")
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
