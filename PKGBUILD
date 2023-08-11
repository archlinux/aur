# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-dropstackframes
pkgver=0.1.0
pkgrel=1
pkgdesc="A python library for dropping stack frames"
url="https://github.com/jesnie/dropstackframe"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-poetry')
source=("http://github.com/jesnie/dropstackframe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09467af3af2c890825c937ec1a856580ae66b9ee8a7646e08db8f3d0178bd616')

build() {
  cd "${srcdir}"/dropstackframe-${pkgver}
  poetry build --format wheel
}

package() {
  cd "${srcdir}"/dropstackframe-${pkgver}
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
