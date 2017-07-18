# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: baltic <1000Hz.radiowave at google mail>
pkgname=notes-tree
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Note taking (knowledge base) app with tree like notes structure"
arch=('i686' 'x86_64' 'aarch64')
url="https://bitbucket.org/baltic/notestree/src"
license=('ZLIB')
depends=(
	'qt5-svg'
	'qt5-webkit'
	'boost-libs'
	'gtk-update-icon-cache'
	'desktop-file-utils')
makedepends=(
	'boost')
source=("https://bitbucket.org/baltic/notestree/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('ad81cd9e064e9640783a260e4f19f30e971a7fd5f22ed06272c7c7b04d1ef711')
validpgpkeys=()

build() {
	cd "$srcdir"
	qmake-qt5
	make -j$(nproc)
}

package() {
	cd "$srcdir"
	make INSTALL_ROOT=$pkgdir install
}
