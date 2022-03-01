# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyupgrade
pkgver=2.31.0
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/asottile/pyupgrade/archive/v${pkgver}.tar.gz")
sha256sums=('4398e2b7b6fee8de8a4ae51e6ce22e3d8ec159df5df14fc7738294961c37a46d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

