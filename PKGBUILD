# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='0.3.1'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools')

source=("https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('de84c7f1ae5bf16c39965ce7d73069c676cfea85dd9d0ec519bb729809a31732')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --skip-build --root="${pkgdir}" --prefix="/usr"
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m unittest
}

# vim:set ts=2 sw=2 et:
