# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.3.4
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
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/78ce5778f5dcc354f5dc4dd2fead599e7643dd16/gweb-78ce5778f5dcc354f5dc4dd2fead599e7643dd16.tar.gz")
noextract=()
sha256sums=("1b45c2d3cdedbf166195c8b3f250be96616554175ca7a8627882e1007e06d4fb")
validpgpkeys=()

prepare() {
	cd gweb-78ce5778f5dcc354f5dc4dd2fead599e7643dd16
	./configure.sh -p "$pkgdir/usr" -r
}

build() {
	cd gweb-78ce5778f5dcc354f5dc4dd2fead599e7643dd16
	make
}

package() {
	cd gweb-78ce5778f5dcc354f5dc4dd2fead599e7643dd16
	mkdir -p "$pkgdir/usr/bin"
	make install
}
