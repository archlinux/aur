# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-molmass
_name=${pkgname#python-}
pkgver=2022.12.9
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD3)
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cee9373b745faf13cd6f48f705a8472fdcf1fb0dbd85a171b7f8906c1c5c301e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
