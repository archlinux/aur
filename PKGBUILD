pkgname=coin-or-coinmetis
pkgver=1.3.8
pkgrel=1
pkgdesc="COIN-OR autotools harness to build Metis"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-Metis/"
license=('custom')
groups=('coin-or')
depends=('glibc')
makedepends=('wget')
source=("https://github.com/coin-or-tools/ThirdParty-Metis/archive/releases/$pkgver.tar.gz")
sha256sums=('97bf0f8787c1a6491fd2de2a8053872d7786d00b29cb574c851c32cd9aae3673')

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
