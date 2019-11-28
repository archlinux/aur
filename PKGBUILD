pkgname=coin-or-coinasl
pkgver=1.4.1
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('coin-or')
depends=('glibc')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz")
sha256sums=('c6fa24ab952243f10f5231d49a46c206d239cffe5793f0ae46651adcc4da0b45')

prepare () {
  cd "ThirdParty-ASL-releases-$pkgver"
  ./get.ASL
}

build() {
  cd "ThirdParty-ASL-releases-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "ThirdParty-ASL-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="${pkgdir}" install
}
