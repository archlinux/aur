pkgname=qtbitcointrader
pkgver=1.40.13
pkgrel=1
pkgdesc='Secure Trading Client for most popular Bitcoin exchanges'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha256sums=(4549ad915d212a065577018c0bee14b6330586a1bf4e0dd60415634891031176)

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
