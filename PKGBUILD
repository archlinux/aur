pkgname=coin-or-coinasl
pkgver=1.4.3
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('coin-or')
depends=('glibc')
makedepends=('wget')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz")
sha256sums=('0a4cfa7c6c5df72d8e1c4c3ce74633421f807115a679e85cb5569c41df9a9aaf')

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
