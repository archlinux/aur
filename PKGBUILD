# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=adjbacklight
pkgver=8.2.1
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('custom:ISC')
depends=('linux')
source=(adjbacklight-$pkgver.tar.gz::https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(b7a3c90826ced10bd7c31081d07fa834b9900a54e36c8f84b29cb51871bc69c6)

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
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
