pkgname=phototonic
pkgver=1.6.2
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/0f7884eaed130c4269b9522d3bd2628a89e24163.tar.gz")
md5sums=('9507f6d5b74b3c2b9905169ff0878b99')

build() {
  cd "$srcdir/$pkgname-0f7884eaed130c4269b9522d3bd2628a89e24163"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-0f7884eaed130c4269b9522d3bd2628a89e24163"
  make INSTALL_ROOT="$pkgdir/" install
}
