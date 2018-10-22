pkgname=qtbitcointrader
pkgver=1.40.22
pkgrel=2
pkgdesc='Secure Multi Trading Client'
arch=(x86_64)
url=https://centrabit.com/
license=(GPL3)
depends=(qt5-multimedia qt5-script)
_commit=9162a60e0309bea07eab3608bf47c8a7eebff91c
source=("QtBitcoinTrader-20181021.tar.gz::https://codeload.github.com/JulyIGHOR/QtBitcoinTrader/tar.gz/$_commit")
sha256sums=(21212be02b712c60981c5fbb7a84bf0e4b0b3c718354c1469fb78ce2b3f653a2)

build() {
  cd QtBitcoinTrader-$_commit/src
  qmake QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  make -C QtBitcoinTrader-$_commit/src INSTALL_ROOT="$pkgdir" install
}
