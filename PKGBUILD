# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=4.24
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('perl>=5.0')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")
md5sums=('5772b0f41c07ff4bd9814da6fcb155d5')

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
