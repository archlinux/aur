pkgname=qtbitcointrader
pkgver=1.20.01
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(i686 x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(http://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(11df0b81b1681e9c2b2ef44270715bc7c9a5055eb5d013c9936d4c9d04cbff43)

build() {
  cd QtBitcoinTrader-$pkgver/src

  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" QtBitcoinTrader_Desktop.pro

  make
}

package() {
  cd QtBitcoinTrader-$pkgver/src

  make INSTALL_ROOT=$pkgdir install

  install -d $pkgdir/usr/share/doc/QtBitcoinTrader
  install -m644 ../*.md LICENSE* $pkgdir/usr/share/doc/QtBitcoinTrader
}
