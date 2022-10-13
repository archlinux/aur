# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.2.1
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
options=(!buildflags)
depends=('perl>=5.0' 'go>=2:1.13' 'gperf')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")
sha256sums=('764fd843759d52f90c2c6b6aa89a3cb82d05ff26e2064b9109c908f7fd131daf')

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
