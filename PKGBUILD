# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.1.0
pkgrel=3
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
options=(!buildflags)
depends=('perl>=5.0' 'go>=1.13' 'gperf')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")
sha256sums=('e1b5ac3345f942737f5b9a301b311fbbc3897d8a2c8910dff0aa0a50853765ed')

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
