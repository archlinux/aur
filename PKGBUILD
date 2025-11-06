# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: FederAndInk

pkgname=circup
pkgver=2.3.0
pkgrel=1
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker' 'python-click' 'python-semver')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('ce5117d6353d3b3055793738b35735955d1f535566eb90a8e0f9138814b18284')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
