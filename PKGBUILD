_base=Flask-Wdb
pkgname=python-${_base,,}
pkgver=0.0.2
pkgrel=2
pkgdesc="Integrate Wdb instead of Werkzeug debugger for Flask applications"
arch=('any')
url="https://github.com/techniq/${_base,,}"
license=('custom')
depends=(python-wdb)
makedepends=(python-setuptools)
source=("https://pypi.io/packages/source/${_base:0:1}/${_base}/${_base}-${pkgver}.tar.gz")
sha512sums=('c3077ce9c6379f5412b308a07e3e106ed010dab437cbb63c61673ec925a94499bd47848ada2f2c891c4cca443c4e382585ee751c8736ee86073245e4bca49e54')

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
