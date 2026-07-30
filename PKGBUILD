# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=molmass
pkgname=python-${_pypiname,,}
pkgver=2026.6.9
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=(BSD-3-Clause)
depends=('python>=3.8')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('61cd66d032379192d898d5b49b821607ccaf4b6f79159a12b5de69b365878982')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
