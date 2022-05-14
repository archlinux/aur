# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15message
pkgver=1.2
pkgrel=4
pkgdesc="A simple message/alert tool for g15daemon and the Logitech G15."

arch=('x86_64')
url="https://gitlab.com/menelkir/g15message"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('aac0bcfa92020abe371cb7023236b8f4590eedb301e9d2731f6b7b012baf9a6898b9139bebe5e6adb004979162f36b6aed27522be67e7829e41a0609dc761af9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
