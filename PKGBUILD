pkgname=qtbitcointrader
pkgver=1.30.04
pkgrel=1
pkgdesc='Secure Trading Client for most popular Bitcoin exchanges'
arch=(i686 x86_64)
url=http://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(378bbdf7679ce25a0212b96a55949b14f17e2225cf059d8de18975da9822006d)

build() {
  cd src/

  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"

  make
}

package() {
  cd src/

  make INSTALL_ROOT=$pkgdir install

  install -d $pkgdir/usr/share/doc/QtBitcoinTrader/
  install -m644 LICENSE.GPL3 ../README.md $pkgdir/usr/share/doc/QtBitcoinTrader/
}
