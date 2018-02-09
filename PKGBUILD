# Maintainer: Razer <razer@neuf.fr>
pkgname=python-pylint-django
_pypi_pkgname=pylint-django
pkgver=0.9.0
pkgrel=1
pkgdesc="Pylint plugin for improving code analysis for when using Django"
arch=('any')
url="https://github.com/landscapeio/pylint-django"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint-plugin-utils')
# source=(https://github.com/landscapeio/pylint-django/archive/${pkgver}.tar.gz)
# Temp source override because there's not tag for 0.7.2
source=(https://files.pythonhosted.org/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz)
md5sums=('3a85d37a1cd56cabc518c2d0673bb83f')

build() {
  cd "${_pypi_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pypi_pkgname}-${pkgver}"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
