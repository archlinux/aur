# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-molmass
_name=${pkgname#python-}
pkgver=2023.8.30
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD3)
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8c693341613dab3612edfc3267a22d30b7d8e45a4e4ce25eb71c5788e332f7fb')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
