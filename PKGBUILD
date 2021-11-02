# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

_pyname=circuitbreaker
pkgname=python-${_pyname}
pkgver=1.2.0
pkgrel=1
pkgdesc='Python implementation of the Circuit Breaker pattern'
arch=('x86_64')
url="https://github.com/fabfuel/${_pyname}"
license=('BSD')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8ea1249bb7cc5e89ec833fa68b21712a18aebe5480193d09b7f410668632cf6d')

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
