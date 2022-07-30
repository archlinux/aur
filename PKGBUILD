# Contributor: qlonik <volodin.n at gmail dot com>

_base=meteor-ejson
pkgname=python2-${_base}
pkgver=1.1.0
pkgrel=1
pkgdesc="Encoder and Decoder for Extended JSON (EJSON) as used in Meteor and DDP"
url="https://github.com/lyschoening/${_base}-python"
depends=(python2-six)
makedepends=(python2-setuptools)
license=(MIT)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('eb211d262f0006f3229296b71320f68b59d8a7e618e65baa8e613f874a0e6ac9cfe45e30fc73ba57c42129204c5f27a32c4b8b579527fcefd601fa1dc2844da3')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
