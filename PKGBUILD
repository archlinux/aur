# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='0.2.3'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools')

source=("https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('a3af184f32190217704720628e3694ea533004d238b644fe96d0bc7bac5b2d62')

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
