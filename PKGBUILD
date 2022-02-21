# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.1.4
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
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/25caac9f16d5f96c3f03f5c787f1ce385cadeff4/gweb-25caac9f16d5f96c3f03f5c787f1ce385cadeff4.tar.gz")
noextract=()
sha256sums=("35341bdc8cc245651fd36081cc1c8666c630e3e38baf37a41076403ded6c1f87")
validpgpkeys=()

prepare() {
	cd gweb-25caac9f16d5f96c3f03f5c787f1ce385cadeff4
	./configure.sh -p "$pkgdir/usr" -r
}

build() {
	cd gweb-25caac9f16d5f96c3f03f5c787f1ce385cadeff4
	make
}

package() {
	cd gweb-25caac9f16d5f96c3f03f5c787f1ce385cadeff4
	mkdir -p "$pkgdir/usr/bin"
	make install
}
