# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=i2

pkgname=python-${_name}
pkgver=0.1.48
pkgrel=1
pkgdesc="Python Mint creation, manipulation, and use"
arch=('any')
url="https://github.com/i2mint/${_name}"
license=('Apache-2.0')
depends=(python)
makedepends=(python-build python-installer python-setuptools)
source=(${_name}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('f4fde601e9dc9a94568df17adf0a5828c210617ae84f3b2e70cbe42eebfccad844e959897a5d1564d58d91e66c93f95f560f8d5a949dd970d4e7b9fe41b15f98')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
