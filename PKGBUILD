# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=polo
pkgname=python-polo
pkgver=0.5
pkgrel=2
pkgdesc="Python optimal leaf ordering for hierarchical clustering"
arch=(any)
url="https://pypi.python.org/pypi/polo"
license=(MIT)
depends=(python-numpy python-scipy)
makedepends=(python-setuptools cython)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c58deca2aedbb1b9bdfa39b90fc05a80c240cb9d352909cf6a4c8145e5d4b501618d5076a1d1381ae99607f5adee757b28462fd13d7a3c26cce1ee72d77dc7fa')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
