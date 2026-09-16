# Maintainer: Marek Mahut <marek@mahut.dev>

pkgname=badfish
pkgver=1.8.0
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
sha256sums=('45bc245c08e45a2077578cb3a3dd65a95aca5f4cfa8f00996195f5a42504023b')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
