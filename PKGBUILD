# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-tokenize-rt
_pkgname=tokenize-rt
pkgver=4.1.0
pkgrel=1
pkgdesc="A wrapper around the stdlib tokenize which roundtrips."
arch=('any')
url="https://github.com/asottile/tokenize-rt"
license=('MIT')
depends=("python")
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}::https://github.com/asottile/tokenize-rt/archive/v${pkgver}.tar.gz")
sha256sums=('7043d391eae7e6ab3e2e69ab2995b4d9873f56805a55d2ba2db128f468efbace')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

