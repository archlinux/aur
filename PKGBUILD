# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.5.7
pkgrel=1
epoch=
pkgdesc="a simple web browser written in C"
arch=('any')
license=("MIT")
groups=()
depends=("gtk3" "webkit2gtk")
makedepends=("make" "gcc" "pkgconf")
checkdepends=()
optdepends=()
provides=('gweb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/37d72fb37365de680f7d6fa790534d3fe5aec318/gweb-37d72fb37365de680f7d6fa790534d3fe5aec318.tar.gz")
sha256sums=('6de73e606fcff7239121e3b369039103669c8027e833fc5ac396af0b9a5ebbe4')
noextract=()
validpgpkeys=()

prepare() {
	cd gweb-37d72fb37365de680f7d6fa790534d3fe5aec318
	./configure.sh -p "$pkgdir/usr" -r
}

build() {
	cd gweb-37d72fb37365de680f7d6fa790534d3fe5aec318
	make
}

package() {
	cd gweb-37d72fb37365de680f7d6fa790534d3fe5aec318
	make install
}
