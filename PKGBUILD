# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-rich-click
_pkgname=rich-click
pkgver=1.7.3
pkgrel=1
pkgdesc="Python module to format click help output nicely with Rich."
arch=('any')
url="https://github.com/ewels/rich-click"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/ewels/rich-click/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a55419359e4b30da0cf3156977885b784530edaf648030f509acb165fb8fb589')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
