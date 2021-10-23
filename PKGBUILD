# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.3.6
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
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/88984fc6311e562ff82882ddfee1e3cce55e1f87/vct-88984fc6311e562ff82882ddfee1e3cce55e1f87.tar.gz")
noextract=()
sha256sums=("6e0db23314ebea22412cab2a03f9eb0a23e7f426dab5fcd15c939ab8b9d15c16")
validpgpkeys=()

build() {
	cd 'vct-88984fc6311e562ff82882ddfee1e3cce55e1f87'
	rustup install $(cat rust-toolchain)
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-88984fc6311e562ff82882ddfee1e3cce55e1f87'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
