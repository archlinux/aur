# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory
pkgver=0.0.1
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject' 'python2-polib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a6a41bce46e41760a975bd1f53939edc2a1d3e0f7f25e0b3370c8e8082f85132')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
