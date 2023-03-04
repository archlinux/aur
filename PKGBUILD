# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_pyname=circuitbreaker
pkgname=python-${_pyname}
pkgver=1.4.0
pkgrel=1
pkgdesc='Python implementation of the Circuit Breaker pattern'
arch=('x86_64')
url="https://github.com/fabfuel/${_pyname}"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('30f24b32edf964ff2ea7c3c18959e2e3e08b6259b85ab442ea825e3f240323ab')

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
