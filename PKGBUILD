# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15composer
pkgver=3.4
pkgrel=3
pkgdesc="A library to render text and shapes into a buffer usable by the Logitech G15"

arch=('x86_64')
url="https://gitlab.com/menelkir/g15composer"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('43f1e57df642d599554a454ef6aeb5ebd74aa9f9e002031c7f1d83748a4e3fafae1b9675f1347a5a829f8d8d4433c8f83309c1842ac264f51807d8d38ee36c66')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo ""
  echo "You need to install an init script depending on what you're using it."
  echo ""
}
