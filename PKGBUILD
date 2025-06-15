# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=molmass
pkgname=python-${_pypiname,,}
pkgver=2025.4.14
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=(BSD-3-Clause)
depends=('python>=3.8')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('cb9c15f482b09ed8ad484315ccdf14b4eb3059d57538cdab2d1e1962f5f80e50')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
