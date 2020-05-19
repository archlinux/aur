# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=silentjack
pkgver=0.3
pkgrel=1
pkgdesc="A silence/dead air detector for the Jack Audio Connection Kit"
arch=('x86_64')
url="https://www.aelius.com/njh/silentjack"
license=('GPL2')
depends=('jack')
source=("${pkgname}-${pkgver}.tar.gz::https://www.aelius.com/njh/silentjack/silentjack-${pkgver}.tar.gz")
sha256sums=('87025362cd86d98f8a484e49614696a6a113562d5af45781d9bb4a86e2b1e019')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR=$pkgdir make install
}