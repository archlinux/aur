# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyupgrade
pkgver=2.31.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/asottile/pyupgrade/archive/v${pkgver}.tar.gz")
sha256sums=('8cb92e9b0dc3cb0b2975b90e664cdc570833681bdd61b9b61a761619119ddf2a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

