pkgname=qtbitcointrader
pkgver=1.40.40
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=("https://downloads.sourceforge.net/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz")
sha256sums=(57e3119990b24cf821e27d05694792c33f3793f890b199835ae61fa26b9af6b2)

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
