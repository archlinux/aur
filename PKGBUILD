# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools')

source=("https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('b9e9a6d500cfb6e93b5794e416223f22879d81a467eeb79f44123401b52aeac0')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m unittest
}

# vim:set ts=2 sw=2 et:
