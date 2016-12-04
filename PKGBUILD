# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=phototonic
pkgver=1.7.13
pkgrel=2
_commit=c1998178dfc49275c716250914ee1aac910ab908
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oferkv/phototonic/archive/$_commit.tar.gz")
md5sums=('6c65ca3cb26f575c3983bcde15246ada')

build() {
  cd $pkgname-$_commit

  qmake-qt5 PREFIX="/usr" \
    QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd $pkgname-$_commit

  make INSTALL_ROOT="$pkgdir" install
}
