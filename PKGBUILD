pkgname=qtbitcointrader
pkgver=1.40.41
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha256sums=(60135fd6dbaa0c55186f8f2f5f68e038886250e336c8d105e34cdf8436a52e03)

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
