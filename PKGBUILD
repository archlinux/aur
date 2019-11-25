# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-tokenize-rt
_pkgname=tokenize-rt
pkgver=3.2.0
pkgrel=1
pkgdesc="A wrapper around the stdlib tokenize which roundtrips."
arch=('any')
url="https://github.com/asottile/tokenize-rt"
license=('MIT')
depends=("python")
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::https://github.com/asottile/tokenize-rt/archive/v${pkgver}.tar.gz")
sha256sums=('d43801fbc8ca369736ba336246df0c3923134649e3daa150c0f48d6dd0fcbc75')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

