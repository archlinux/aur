pkgname=calcelestial
pkgver=0.4.1
pkgrel=1
pkgdesc="calculates positions, rise and set times of celestial bodies"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.steffenvogel.de/2012/12/23/cron-jobs-fur-sonnenauf-untergang/"
license=('GPL3')
depends=('libnova')
source=("https://github.com/stv0g/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cac61a6bfc245fba2df0d6a6e33d01e6')
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
