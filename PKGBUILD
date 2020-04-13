# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-tokenize-rt
_pkgname=tokenize-rt
pkgver=4.0.0
pkgrel=1
pkgdesc="A wrapper around the stdlib tokenize which roundtrips."
arch=('any')
url="https://github.com/asottile/tokenize-rt"
license=('MIT')
depends=("python")
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::https://github.com/asottile/tokenize-rt/archive/v${pkgver}.tar.gz")
sha256sums=('620262d87dff65498f88c661794e1745018e3b5f081645fb1d5c640d879af554')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

