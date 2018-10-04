pkgname=qtbitcointrader
pkgver=1.40.21
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha256sums=(4b1fe12545b2459fe199e11c76663039fc644825b6c430fa9ffddf2336351af4)

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
