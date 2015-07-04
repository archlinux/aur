pkgname=phototonic
pkgver=1.6.5
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/b95a6e735ed808e2fe4eae58cf0e81ae0c0916e4.tar.gz")
md5sums=('5955368342fb0e3f146b62a7551d412d')

build() {
  cd "$srcdir/$pkgname-b95a6e735ed808e2fe4eae58cf0e81ae0c0916e4"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-b95a6e735ed808e2fe4eae58cf0e81ae0c0916e4"
  make INSTALL_ROOT="$pkgdir/" install
}
