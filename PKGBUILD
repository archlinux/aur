# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.1.3
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
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/1a33a2b677aa315ab1b5c94da00b94c654ee3824/gweb-1a33a2b677aa315ab1b5c94da00b94c654ee3824.tar.gz")
noextract=()
sha256sums=("cbb911ecaaa90571c3049d487621b7c23614bb2babc7f3e46eb9fd94c32a090f")
validpgpkeys=()

prepare() {
	cd gweb-1a33a2b677aa315ab1b5c94da00b94c654ee3824
	./configure.sh -p "$pkgdir/usr"
}

build() {
	cd gweb-1a33a2b677aa315ab1b5c94da00b94c654ee3824
	make
}

package() {
	cd gweb-1a33a2b677aa315ab1b5c94da00b94c654ee3824
	mkdir -p "$pkgdir/usr/bin"
	make install
}
