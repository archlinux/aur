# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=cbor2
pkgname=python-cbor2
pkgver=5.4.1
pkgrel=1
pkgdesc='Pure Python CBOR (de)serializer with extensive tag support'
url="https://github.com/agronholm/cbor2"
arch=('x86_64')
license=('MIT')
depends=('python')
makedepends=('python-setuptools-scm' 'git')
source=("git+$url#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
