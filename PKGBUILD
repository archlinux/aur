# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xvid4conf
pkgver=1.13
pkgrel=2
pkgdesc="Creates XviD configuration files"
arch=('x86_64')
url="https://twolife.be"
license=('GPL2')
depends=('gtk3')
source=($url/$pkgname/${pkgname}_${pkgver}.tar.gz)
md5sums=('84dad76f806f0806be670704636b1951')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-gtk3
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
