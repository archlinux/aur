# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-uvicorn
pkgver=0.11.3
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
sha256sums=('b19934169d8e032c06f372883d941c324f10187b147c6b33a12f464a3f63eeae')

_pkgname=uvicorn

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
