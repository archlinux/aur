# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-molmass
_name=${pkgname#python-}
pkgver=2022.10.18
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD3)
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1fda78f7e69af7fce9482ec85ef524a95b674f51ebfd366f6fe8c1850b5d848e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
