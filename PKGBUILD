# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: FederAndInk

pkgname=circup
pkgver=3.0.1
pkgrel=1
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker' 'python-click' 'python-semver')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('be1d40d4aa6c8fdb4672b807bf99fa58955a8ebcb91c566637e98989c39aec94')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
