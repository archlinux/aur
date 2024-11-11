# Maintainer: Razer <razer@neuf.fr>
pkgname=python-pylint-django
_pypi_pkgname=pylint-django
pkgver=2.6.1
pkgrel=1
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
sha256sums=('19e8c85a8573a04e3de7be2ba91e9a7c818ebf05e1b617be2bbae67a906b725f')

build() {
  cd "${_pypi_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pypi_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  #install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
