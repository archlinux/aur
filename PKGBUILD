# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=4.26
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('perl>=5.0' 'gperf')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")
md5sums=('549ed5724c04a3c3101f4180a09c8d9b')

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
