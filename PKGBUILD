pkgname=coin-or-coinasl
pkgver=1.4.2
pkgrel=1
pkgdesc="COIN-OR autotools harness to build AMPL Solver Library"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-ASL/"
license=('MIT')
groups=('coin-or')
depends=('glibc')
makedepends=('wget')
source=("https://github.com/coin-or-tools/ThirdParty-ASL/archive/releases/$pkgver.tar.gz")
sha256sums=('1816800470e84ed188df3f9cbd59dfb26cc5a9951dbf1f4cc7ec1b0a6010ffaa')

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
