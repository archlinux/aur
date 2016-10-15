pkgname=qtbitcointrader
pkgver=1.30.01
pkgrel=1
pkgdesc='Secure Multi Trading Client'
arch=(i686 x86_64)
url=http://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
source=(https://downloads.sourceforge.net/project/bitcointrader/SRC/QtBitcoinTrader-$pkgver.tar.gz)
sha256sums=(af8dbf1f3c11103920a0332b65ef0d9fd0338c51203cf54127f4846e62d857f3)

build() {
  cd QtBitcoinTrader-$pkgver/src/

  qmake-qt5 QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" QtBitcoinTrader_Desktop.pro

  make
}

package() {
  cd QtBitcoinTrader-$pkgver/src/

  make INSTALL_ROOT=$pkgdir install

  install -d $pkgdir/usr/share/doc/QtBitcoinTrader/
  install -m644 LICENSE.GPL3 ../README.md $pkgdir/usr/share/doc/QtBitcoinTrader/
}
