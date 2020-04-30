# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-uvicorn
pkgver=0.11.5
pkgrel=1
pkgdesc='The lightning-fast ASGI server.'
arch=('x86_64')
url='https://www.uvicorn.org'
license=('BSD-3-Clause')
depends=(python python-click python-h11 python-websockets python-httptools
         python-uvloop)
optdepends=()
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://github.com/encode/uvicorn/archive/$pkgver.tar.gz")
sha256sums=('be40828a1cdabbc9fccf90b2d846f866f2c5e846e3ef7f75101cb3c76e9fc2df')

_pkgname=uvicorn

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
