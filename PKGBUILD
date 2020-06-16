# Maintainer: Sepp <dev at dwurp dot de>
# Contributor: Muflone http://www.muflone.com/contacts/english/

pkgname=python-jaydebeapi
_pkgname="${pkgname/*-/}"
pkgver=1.2.3
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('LGPL3')
depends=('python' 'python-jpype1' 'python-setuptools')
source=("JayDeBeApi-${pkgver}.tar.gz"::"https://github.com/baztian/jaydebeapi/archive/v${pkgver}.tar.gz")
sha256sums=('6ca5e4c2a333b03fa7a14f50cb8c33756fdd6dc02c696acc30fda406f2368031')

build() { 
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
