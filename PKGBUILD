# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=flask-seasurf
pkgname='python-flask-seasurf'
pkgver='1.1.1'
pkgrel='1'
pkgdesc='Flask extension for preventing cross-site request forgery (CSRF)'
arch=('any')
url='http://flask-seasurf.readthedocs.io'
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools')
checkdepends=('python-mock')

source=("$pkgname-$pkgver.tar.gz::https://github.com/maxcountryman/flask-seasurf/archive/$pkgver.tar.gz")
sha256sums=('cadf64297c6e33743c078e5269643effe3dd5d880a75682692a487aeec8edc15')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --skip-build --root="${pkgdir}" --prefix="/usr"
}

#check() {
  #cd "${_pkgname}-${pkgver}"
  #python -m unittest
#}

# vim:set ts=2 sw=2 et:
