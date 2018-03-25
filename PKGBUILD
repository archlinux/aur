# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-jaydebeapi
_pkgname="${pkgname/*-/}"
pkgver=1.1.1
pkgrel=1
pkgdesc="A bridge from JDBC database drivers to Python DB-API"
arch=('any')
url="https://github.com/baztian/jaydebeapi"
license=('GPL3')
makedepends=('python2')
depends=('python2' 'python2-jpype1' 'python2-setuptools')
source=("JayDeBeApi-${pkgver}.tar.gz"::"https://github.com/baztian/jaydebeapi/archive/v${pkgver}.tar.gz")
sha256sums=('f3310594c125de129c003a661913cbbf2018bc91ec65528b70c61339c3a9f168')

build() { 
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

