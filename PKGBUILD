# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nanoid
pkgname=python-${_base}
pkgdesc="A tiny, secure, URL-friendly, unique string ID generator for Python"
pkgver=2.0.0
pkgrel=1
arch=(any)
url="https://github.com/puyuan/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7db65075357feb19c4747be9abca1a19a2b8583f82cdcae87f06846141d798a725128ee784ce33cd3b14b272c0beb2dcac0faf4536e8d5183eaa06eab79fff87')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
