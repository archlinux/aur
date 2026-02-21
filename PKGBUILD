# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pypiname=molmass
pkgname=python-${_pypiname,,}
pkgver=2026.1.8
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(any)
url="http://pypi.python.org/pypi/${_pypiname}"
license=(BSD-3-Clause)
depends=('python>=3.8')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname//-/_}/${_pypiname//-/_}-${pkgver}.tar.gz")
sha256sums=('6f677940148f876a6690149956598841f068111cb8ff3c63cf831833e88a5247')

build() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
