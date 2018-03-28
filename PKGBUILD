# Maintainer: Razer <razer@neuf.fr>
pkgname=python-pylint-django
_pypi_pkgname=pylint-django
pkgver=0.9.4
pkgrel=0
pkgdesc="A Pylint plugin to help Pylint understand the Django web framework"
arch=('any')
url="https://github.com/landscapeio/pylint-django"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint-plugin-utils')
# source=(https://github.com/landscapeio/pylint-django/archive/${pkgver}.tar.gz)
# Temp source override because there's not tag for 0.7.2
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('7012ed87de4db8bb3330edfc9fcaef86')

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
