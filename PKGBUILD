# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=4.17
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('perl>=5.0')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")
md5sums=('af384fe5e3bbe8c85338c6fc8bcb7b40')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
#   Modify the below to configure default location for candlelighting time 
#   ./configure  --prefix=/usr --with-default-city='New York'
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
