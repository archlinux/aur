# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=adjbacklight
pkgver=8.2.2
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://codeberg.org/maandree/adjbacklight"
license=('custom:ISC')
source=(adjbacklight-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(7cfa3933222d1b6025cbcadc2385160601fabc5aaaab47406589ca12c2134644)

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
