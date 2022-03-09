# Contributor: Jagannathan Tiruvallur Eachambadi <jagannathante@gmail.com>
_base=time-uuid
pkgname=python-${_base/-/_}
pkgver=0.2.0
pkgrel=1
pkgdesc="A sensible class for dealing with UUIDv1"
arch=(any)
license=('custom')
url="https://github.com/samuraisam/${_base/-/_}"
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('99c6f51dccf289f8470ea402485096fd946d8770006297c06540e93b95dcbc7630266961fc021b40fae648f15cb45d5667a416397b92281831984798d0a4d234')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
