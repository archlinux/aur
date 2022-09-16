# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=circup
pkgver=1.1.2
pkgrel=2
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('8e2a4f63439f6784e23c12d122d1c25059bf5946ac6fb1e8a33bf3f822e04a21')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
