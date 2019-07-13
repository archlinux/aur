# Maintainer: Razer <razer@neuf.fr>
pkgname=python-pylint-django
_pypi_pkgname=pylint-django
pkgver=2.0.11
pkgrel=0
pkgdesc="A Pylint plugin to help Pylint understand the Django web framework"
arch=('any')
url="https://github.com/landscapeio/pylint-django"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint-plugin-utils')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('6740b60dd94b6896cffa28d7fe1bb5dd167cbdcb3d9fb3db01b30390ea18b987')

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
