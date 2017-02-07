# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject' 'python2-polib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('dfabf9957c463df71b5faa4070a472be047e4530b900f66315a24eda4e634271')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
