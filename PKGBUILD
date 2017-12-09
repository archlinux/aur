# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=adjbacklight
pkgver=8.1
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('custom:ISC')
depends=('linux')
source=(adjbacklight-$pkgver.tar.gz::https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(55c36eddae36f3950fa04e5d2bed4b65dd5a2b38ab5fb3ce962fbdce2339b4eb)

build() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

check() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
