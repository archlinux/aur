# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=PyNUTClient
pkgname=python-${_pypiname,,}
pkgver=2.8.2
pkgrel=2
pkgdesc="Python client bindings for NUT"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=('GPL-2.0-or-later AND GPL-3.0-or-later')
depends=('python>=2.6')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('b32af28ac141bb1d05a97814ab22b1dc90f2e55a73657f99c5126384ca2df85a')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
