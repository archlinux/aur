# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace
pkgver=0.4.2
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="http://www.muflone.com/gptrace/"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'python2-ptrace' 'gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3dfe39680e3e10beedee89a095c231d53efca74c0b6a79703f547b9287566b89')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

