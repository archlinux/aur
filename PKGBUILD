# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('c7e715a80d7a469561b7712f2406164494ed9da43d4cbbce3efa907548c6ddbb')

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
