# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=molmass
pkgname=python-${_pypiname,,}
pkgver=2024.10.25
pkgrel=2
pkgdesc="Molecular mass calculations"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=(BSD-3-Clause)
depends=('python>=3.8')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('a5757b65432775bda30332bcd5bf648427c918df2163f991bc9b279b3f81d625')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
