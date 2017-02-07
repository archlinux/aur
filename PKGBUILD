# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject' 'python2-polib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5c1b6f3771b22b8d44dc43fb83fb18bbece9d0a714d4109fba42d38c590d62b9')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
