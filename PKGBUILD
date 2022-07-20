# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=adjbacklight
pkgver=8.2.1
pkgrel=2
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://codeberg.org/maandree/adjbacklight"
license=('custom:ISC')
source=(adjbacklight-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(b1a33f0e7c67bc5275b839a511fff54ecd7a5fdb001108282dc4dcb9e365e4e9)

build() {
  cd "${srcdir}/adjbacklight"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

check() {
  cd "${srcdir}/adjbacklight"
  make check
}

package() {
  cd "${srcdir}/adjbacklight"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
