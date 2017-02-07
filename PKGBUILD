# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory
pkgver=0.0.2
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject' 'python2-polib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('17e1fb90a38d9c22a715f58db158ee7822c4bce88d54f31d3abae7c722d3781c')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
