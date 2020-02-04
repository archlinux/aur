pkgname=coin-or-coinmetis
pkgver=1.3.9
pkgrel=1
pkgdesc="COIN-OR autotools harness to build Metis"
arch=('i686' 'x86_64')
url="https://github.com/coin-or-tools/ThirdParty-Metis/"
license=('custom')
groups=('coin-or')
depends=('glibc')
makedepends=('wget')
source=("https://github.com/coin-or-tools/ThirdParty-Metis/archive/releases/$pkgver.tar.gz")
sha256sums=('c75e66ec76b423e4c8c1ead3579fb2aa5fb7844f4efffdeae5b185df80420e3a')

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
