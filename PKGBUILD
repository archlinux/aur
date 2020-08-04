# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyupgrade
pkgver=2.7.2
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/asottile/pyupgrade/archive/v${pkgver}.tar.gz")
sha256sums=('bdc328771a2e1b762dfa82230a9df638226c26fbd1f8f28512e0b3cb6b1ce9d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

