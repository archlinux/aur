# Maintainer: Razer <razer@neuf.fr>
pkgname=python-pylint-django
_pypi_pkgname=pylint_django
pkgver=2.5.5
pkgrel=2
pkgdesc="A Pylint plugin to help Pylint understand the Django web framework"
arch=('any')
url="https://github.com/landscapeio/pylint-django"
license=('GPL2')
depends=(
'python-pylint'
'python-pylint-plugin-utils'
)
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-poetry'
)
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('2f339e4bf55776958283395c5139c37700c91bd5ef1d8251ef6ac88b5abbba9b')

build() {
  cd "${_pypi_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pypi_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
