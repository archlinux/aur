# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Benoit Landrieu (ben@gresille.org)
pkgname=scribus-1.4.8
pkgver=1.4.8
pkgrel=0
epoch=
pkgdesc="scribus 1.4.8 current release stable branch"
arch=('any')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=('hunspell' 'podofo' 'libcups' 'graphicsmagick' 'poppler'
	 'libcdr' 'libvisio' 'libpagemaker' 'harfbuzz-icu' 'python'
	 'qt5-declarative' 'libmspub' 'openscenegraph' 'libqxp'
	 'desktop-file-utils' 'libzmf' 'libfreehand')
makedepends=('cmake' 'qt5-tools')
optdepends=('lib2geom: for mesh distortion')
conflicts=("scribus-svn")
provides=("scribus-stable")
replaces=("scribus")
backup=()
options=()
install=
changelog=
source=("https://netix.dl.sourceforge.net/project/scribus/scribus/1.4.8/scribus-1.4.8.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
    cmake .
	make
}

#check() {
	#cd "$pkgname-$pkgver"
	#make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
