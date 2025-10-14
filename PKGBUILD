# Maintainer: András Wacha <awacha at gmail dot com>
pkgname=python-siphash24
pkgver=1.8
pkgrel=1
epoch=
pkgdesc="Streaming-capable SipHash Implementation"
arch=("any")
url="https://github.com/dnicolodi/python-siphash24"
license=('MIT')
groups=()
depends=()
makedepends=("python-build" python-wheel python-installer cython meson meson-python cmake git)
options=()
source=("siphash24-${pkgver}.tar.gz::https://github.com/dnicolodi/python-siphash24/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c0c33048d2a7862682690a96780073248b7e30b08749ad114d749dfd74df94c')

prepare() {
    true;
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --no-isolation --wheel
}

check() {
    cd "${pkgname}-${pkgver}"
    true
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
