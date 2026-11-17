# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: FederAndInk

pkgname=circup
pkgver=3.2.0
pkgrel=2
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker' 'python-click' 'python-semver')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip' 'python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('158ab86216b01dc57e1b73abbd6fb683a7399e5644c907264a2b1bf3131aea51')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
