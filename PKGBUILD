# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
pkgname=python-flash-patcher
_name=flash-patcher
pkgver=5.0.0
pkgrel=1
pkgdesc="Adobe Flash SWF file patching tool"
arch=('any')
url="https://github.com/rayyaw/flash-patcher"
license=('CC-BY-SA-4.0')
depends=('ffdec' 'python' 'python-antlr4')
makedepends=('python-installer' 'python-hatch' 'antlr4')
source=("https://github.com/rayyaw/flash-patcher/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('30468ef0737e908c16c9bf5e51484c1eab06a0841213a5bd7b082673a4b17addba0618cc0a988d6cc849ca6db9e966a91fd20830c5980789426be04739963e9f')

prepare() {
    rm "${_name}-${pkgver}/flash_patcher/antlr_source/.gitkeep"
}

build() {
    cd "${_name}-${pkgver}/build"
    make
}

package() {
    cd "${_name}-${pkgver}/build"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

