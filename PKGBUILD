# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.3.8
pkgrel=1
epoch=
pkgdesc="a vocabulary trainer written in rust"
arch=('any')
license=("MIT")
groups=()
depends=()
makedepends=("rustup")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/32311f9f49ea547bbd478fff4ec90e93d213f609/vct-32311f9f49ea547bbd478fff4ec90e93d213f609.tar.gz")
noextract=()
sha256sums=("4f3c4fe39901545f799f4c6cb3d3baaabdd8e3cc25da68e3a6d6b1cca4cf6694")
validpgpkeys=()

build() {
	cd 'vct-32311f9f49ea547bbd478fff4ec90e93d213f609'
	rustup install $(cat rust-toolchain)
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-32311f9f49ea547bbd478fff4ec90e93d213f609'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
