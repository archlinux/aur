# Contributor: jepaan <jepaan at hotmail dot com>
_base=assimp
pkgname=python2-py${_base}
pkgver=5.2.2
pkgrel=1
pkgdesc="Python bindings for the Open Asset Import Library (ASSIMP)"
arch=(any)
license=('custom')
depends=(assimp python2)
makedepends=(python2-setuptools)
url="https://github.com/${_base}/${_base}"
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7f11f3e53bdcd43a81be49ce2ad90d97769ae1c3c6157f57e8a0b2b41c72f394ad1afcdc5f5fa6fbfa1a44233fed4b9a578d5548ec5b9aae2113ef88c2ec843a')

build() {
  cd ${_base}-${pkgver}/port/PyAssimp
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}/port/PyAssimp
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
