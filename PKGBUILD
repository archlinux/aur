pkgname=coin-or-coinglpk
pkgver=1.10.7
pkgrel=1
pkgdesc="COIN-OR autotools harness to build Glpk"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-Glpk"
license=('custom')
groups=('coin-or')
depends=('gmp')
makedepends=('wget')
source=("https://github.com/coin-or-tools/ThirdParty-Glpk/archive/releases/$pkgver.tar.gz")
sha256sums=('0bc56db9d9031bb699f91fd6d312cbd236a7d310af01d3296ba31cea3421024a')

prepare () {
  cd "ThirdParty-Glpk-releases-$pkgver"
  ./get.Glpk
}

build() {
  cd "ThirdParty-Glpk-releases-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "ThirdParty-Glpk-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="${pkgdir}" install
}

