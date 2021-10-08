# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="a vocabulary trainer written in rust"
arch=('any')
license=("MIT")
groups=()
depends=()
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
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/main/vct-main.tar.gz")
noextract=()
sha256sums=("4bf96d4f40ef0530f35de21ea54438eaab067575c0c379c6b2d39d93c4fe3f27")
validpgpkeys=()

build() {
	cd vct-main
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd vct-main
	mkdir -p "$pkgdir"/usr/bin
	make install
}
