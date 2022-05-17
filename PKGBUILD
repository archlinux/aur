# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-brain-isotopic-distribution
_name=${pkgname#python-}
pkgver=1.5.9
pkgrel=1
pkgdesc="Fast and efficient theoretical isotopic profile generation"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(Apache-2.0)
depends=(python)
makedepends=(cython python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2b844d7cf04222cbd97b6608d1ec251d69473b9cde581d4bb4b1f548acaaaaf4')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
