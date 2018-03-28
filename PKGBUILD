pkgname=qtbitcointrader
pkgver=1.40.10
pkgrel=1
pkgdesc='Secure Trading Client for most popular Bitcoin exchanges'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(
  "https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz"
)
sha256sums=(1857101d7ec2f12aadaa4210bc97bd9c698bb783ef36a499a05bd885d50ff5d9)

build() {
  cd QtBitcoinTrader-$pkgver/src
  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$pkgver/src INSTALL_ROOT="$pkgdir" install
}
