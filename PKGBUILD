# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=adjbacklight
pkgver=8.0.2
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('custom:ISC')
depends=('linux')
source=(adjbacklight-$pkgver.tar.gz::https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(79a6eb7d60b70db3c16344f79a7c81da84a081ba1e83cdef33d731c3092f988b)

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
