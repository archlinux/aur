# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace
pkgver=0.6.1
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="https://www.muflone.com/gptrace/"
arch=('any')
license=('GPL')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-ptrace')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('536b8d5a46aa299d383e5b73c72200c8e62a784c3ce1f1484792589be1b0c201')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}
