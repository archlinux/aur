# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=pylibconfig2
pkgname=python-${_pypiname,,}
pkgver=0.2.5
pkgrel=5
pkgdesc="Pure python library for libconfig syntax"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=(GPL-3.0-only)
depends=(python python-pyparsing)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('186bd2d88356036ac8770195c8a3e9bac3ccdb3b9e6ecf04be62c307760895c7')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
