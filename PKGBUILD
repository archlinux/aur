# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject' 'python2-polib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ec013222c2c621f7abb1e152342eb31e787d0af0aedb6e5bd3e5753b94819860')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
