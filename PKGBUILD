# Maintainer: Marek Mahut <marek@mahut.dev>

pkgname=badfish
pkgver=1.7.0
pkgrel=1
pkgdesc="Redfish-based API tool for managing bare-metal systems via out-of-band management"
arch=('any')
url="https://github.com/quadsproject/badfish"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-yaml'
    'python-aiohttp'
    'python-setuptools'
    'python-async-lru'
    'python-rich'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quadsproject/badfish/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c11b88a998ae11ccdafe2a1be3acad89a6abfe208fe25353ddf7f87340a0f68d')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
