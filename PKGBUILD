# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-molmass
_name=${pkgname#python-}
pkgver=2024.5.24
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD3)
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('583492ac061f2d20a0badfa174dd5f7ff8d0e4927005578cc656abaac94552f8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
