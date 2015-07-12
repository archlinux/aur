pkgname=qtbitcointrader
pkgver=1.10.01
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(i686 x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(http://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-1.10.01.tar.gz)
sha256sums=(1b6a54cd9a9d59048bcf5c08e6541b403fee8d553080b38e26cf50d12f894d7a)

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
