# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname=python-HierMat
_pkgname=${pkgname#python-}
_python=python
pkgver=0.9.2
pkgrel=1
pkgdesc="An implementation in Python of the concept of hierarchical matrices as described by W. Hackbusch."
arch=('any')
url="https://github.com/maekke97/HierarchicalMatrices"
license=('GPL3')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'python-matplotlib'
  'python-numpy'
  'python-scipy'
  'python-sphinxcontrib-bibtex'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7ae7777df448d7e42078aa66fab6893c20b421e62b320089243f7259adef322f')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel
  #$_python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  #$_python setup.py install --root="$pkgdir"
}



