pkgname=qtbitcointrader
pkgver=1.30.03
pkgrel=1
pkgdesc='Secure Trading Client for most popular Bitcoin exchanges'
arch=(i686 x86_64)
url=http://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(d401e5dbb0ef38d3449d161bd9d470a3605daceeae843c731a854e75e6467bca)

build() {
  cd QtBitcoinTrader-$pkgver/src/

  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"

  make
}

package() {
  cd QtBitcoinTrader-$pkgver/src/

  make INSTALL_ROOT=$pkgdir install

  install -d $pkgdir/usr/share/doc/QtBitcoinTrader/
  install -m644 LICENSE.GPL3 ../README.md $pkgdir/usr/share/doc/QtBitcoinTrader/
}
