# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=adjbacklight
pkgver=8.0.1
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('custom:ISC')
depends=('linux')
source=(adjbacklight-$pkgver.tar.gz::https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(e643c199ab333c75e88304b922e8823d385e464181fdf389fe23c79ff2e91a04)


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
