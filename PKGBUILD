# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyupgrade
pkgver=2.29.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language"
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/asottile/pyupgrade/archive/v${pkgver}.tar.gz")
sha256sums=('9dafc09a988c7f918abb3e94ee677f3263c5f3e77efb40e237fc6cca3d34b422')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

