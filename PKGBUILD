# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.04
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('perl>=5.0' 'go' 'gperf')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")


build() {
  cd "$pkgname-$pkgver"
  autoreconf --install
  ./configure --prefix=/usr
#   Modify the below to configure default location for candlelighting time 
#   ./configure  --prefix=/usr --with-default-city='New York'
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
