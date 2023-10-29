# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: FederAndInk

pkgname=circup
pkgver=1.3.0
pkgrel=1
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker' 'python-click' 'python-semver')
makedepends=('python-setuptools' 'python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('8d0cf14290467b036a38576c56d2d8acdec7acc3592a96d3c30df120d4ea7447')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
