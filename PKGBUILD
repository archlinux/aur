# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=booksorg
pkgver=0.1
pkgrel=1
pkgdesc="booksorg is a easy organizer for your PDF books using qpdfview and poppler library."
arch=('i686' 'x86_64')
url="http://booksorg.sourceforge.net"
license=('GPL3')
depends=('qt5-base')
makedepends=('gcc')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}_${pkgver}.tar.gz")


build() {
   cd $srcdir/${pkgname}_${pkgver}
   qmake-qt5 booksorg.pro  PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
    make
}

package() {
  cd ${srcdir}/${pkgname}_${pkgver}
    make "INSTALL_ROOT=$pkgdir" install

}
sha256sums=('eeea945976f3c5515fba8952cd241826df12115c506bfd64879a0551cf139163')
