# Contributor: minj4ever <minj4ever@inbox.lt>
_base=CodeIntel
pkgname=python-${_base,,}
pkgver=2.0.0
pkgrel=1
pkgdesc="Full-featured code intelligence and smart autocomplete engine"
url="https://github.com/SublimeCodeIntel/${_base}"
makedepends=(python-setuptools)
license=('custom')
arch=('any')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('109b56b1dd5abd965813a4f3ae5951333a822c76af7f7650ff8b621b52500473df3c846f14d278e4cf263186e0e71b158030a7f87456978bdf3069a6929547d3')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package_python-codeintel() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
