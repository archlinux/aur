pkgname=coin-or-coinmetis
pkgver=1.3.8
pkgrel=1
pkgdesc="COIN-OR autotools harness to build Metis"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-Metis/"
license=('custom')
groups=('coin-or')
depends=('glibc')
source=("https://github.com/coin-or-tools/ThirdParty-Metis/archive/releases/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare () {
  cd "ThirdParty-Metis-releases-$pkgver"
  ./get.Metis
}

build() {
  cd "ThirdParty-Metis-releases-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "ThirdParty-Metis-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="${pkgdir}" install
}
