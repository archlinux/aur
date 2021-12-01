# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

_pyname=circuitbreaker
pkgname=python-${_pyname}
pkgver=1.3.2
pkgrel=1
pkgdesc='Python implementation of the Circuit Breaker pattern'
arch=('x86_64')
url="https://github.com/fabfuel/${_pyname}"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('150b1cb0257111261feed3772653f4c3ab291db08a42154eea48518dc24165de')

build() {
  cd "${_pyname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pyname}-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
