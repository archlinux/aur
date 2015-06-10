# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xvid4conf
pkgver=1.13
pkgrel=1
pkgdesc="Creates XviD configuration files"
arch=('i686' 'x86_64')
url="http://twolife.be"
license=('GPL2')
depends=('gtk2')
source=($url/$pkgname/${pkgname}_${pkgver}.tar.gz)
md5sums=('84dad76f806f0806be670704636b1951')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr #--enable-gtk3 #uncomment to build with gtk3
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
