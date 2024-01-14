# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-brain-isotopic-distribution
_name=${pkgname#python-}
pkgver=1.5.16
pkgrel=1
pkgdesc="Fast and efficient theoretical isotopic profile generation"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(Apache-2.0)
depends=(python)
makedepends=(cython python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bb6931b864efb265809f115d4bad9c4ca0e244e70ae7cc43f0cf2fd1b6816466')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
