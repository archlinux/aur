# Maintainer: Sepp <dev at dwurp dot de>
# Contributor: Muflone http://www.muflone.com/contacts/english/

pkgname=python-jaydebeapi
_pkgname="${pkgname/*-/}"
pkgver=1.2.2
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('LGPL3')
makedepends=('python')
depends=('python' 'python-jpype1' 'python-setuptools')
source=("JayDeBeApi-${pkgver}.tar.gz"::"https://github.com/baztian/jaydebeapi/archive/v${pkgver}.tar.gz")
sha256sums=('20c21065417e3d440c5506944a4d879a1c62369378590378f771ee067b6db4e6')

build() { 
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
