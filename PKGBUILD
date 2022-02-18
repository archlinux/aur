# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="a simple web browser written in C"
arch=('any')
license=("GPL")
groups=()
depends=("gtk3" "webkit2gtk")
makedepends=()
checkdepends=()
optdepends=()
provides=('gweb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/d556381795b1b755b748d5e4700c8b331d43f996/gweb-d556381795b1b755b748d5e4700c8b331d43f996.tar.gz")
noextract=()
sha256sums=("54e319b30619d465ea0cf1d10f40c989081b9cfcfbb7214ad5d787e92a04d645")
validpgpkeys=()

prepare() {
	cd gweb-d556381795b1b755b748d5e4700c8b331d43f996
	./configure.sh -p "$pkgdir/usr"
}

build() {
	cd gweb-d556381795b1b755b748d5e4700c8b331d43f996
	make
}

package() {
	cd gweb-d556381795b1b755b748d5e4700c8b331d43f996
	mkdir -p "$pkgdir/usr/bin"
	make install
}
