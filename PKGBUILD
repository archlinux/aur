pkgname=calcelestial
pkgver=0.5
pkgrel=1
pkgdesc="calculates positions, rise and set times of celestial bodies"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.steffenvogel.de/2012/12/23/cron-jobs-fur-sonnenauf-untergang/"
license=('GPL3')
depends=('libnova')
source=("https://github.com/stv0g/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cacf124b1b256197259e0e5db98d0b3a')
conflicts=()
provides=()

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --disable-geonames
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
