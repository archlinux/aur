# Maintainer: Stefan Schad <stefan+aur@finaloutpost.de>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: FederAndInk

pkgname=circup
pkgver=2.2.6
pkgrel=1
pkgdesc="A tool to manage/update libraries on CircuitPython devices."
url="https://github.com/adafruit/circup"
depends=('findimports' 'python-update-checker' 'python-click' 'python-semver')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('e14bf78e18c0eb48c331d942c68caa2545322b861db25a5960a3aa0aaf8d9d50')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
