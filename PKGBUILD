# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pyupgrade
pkgver=1.25.1
pkgrel=1
pkgdesc="A tool to automatically upgrade syntax for newer versions of the language."
arch=('any')
url="https://github.com/asottile/pyupgrade"
license=('MIT')
depends=("python" "python-tokenize-rt")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/asottile/pyupgrade/archive/v${pkgver}.tar.gz")
sha256sums=('2e004fc7c95695da728e19624a7a221da0cdfadf593892d3158130acca0acbf8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

