# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

pkgname=gextractwinicons
pkgver=0.5.2
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="http://www.muflone.com/gextractwinicons"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'gettext')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f5b07cf2fc2b1a989f17fcfe0df4b2e7b1389c19e29b5e66b723e55822c357cb')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

