# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.3.9
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
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/3fa206001abfb103405c272434d4a30b48760bfe/vct-3fa206001abfb103405c272434d4a30b48760bfe.tar.gz")
noextract=()
sha256sums=("a7a6780ef8b1bceac6656edf686096fe90b5cf746f44fc928486f5ef81151fdc")

validpgpkeys=()

build() {
	cd 'vct-3fa206001abfb103405c272434d4a30b48760bfe'
	rustup install $(cat rust-toolchain)
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-3fa206001abfb103405c272434d4a30b48760bfe'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
