_base=wdb
pkgname=python-${_base}
pkgver=3.3.0
pkgrel=1
pkgdesc="An improbable web debugger through WebSockets (client only)"
arch=('any')
url="http://github.com/Kozea/${_base}"
license=(GPL3)
depends=(python-log_colorizer python-jedi)
makedepends=(python-setuptools)
source=("https://pypi.io/packages/source/${_base:0:1}/${_base}/${_base}-${pkgver}.tar.gz")
sha512sums=('0792bb50bcf2859878b0f585876e9e35bbfd50dc25e01eb6f1680891543ecc5e836eee38aed1f1dcab90f7ef9723e104310dabd626e167df410fca1609dd320e')

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
