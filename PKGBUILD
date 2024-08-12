# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-print-color
_name=print-color
pkgver=0.4.6
pkgrel=1
pkgdesc="Simple Python wrapper to print color messages in the terminal"
arch=('any')
url="https://github.com/xy3/print-color"
license=(Apache-2.0)
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xy3/print-color/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fae0613dba48f6a2b7d652003e0993dcec0e3bc064ce535a95aadc6bb3de2d32')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
