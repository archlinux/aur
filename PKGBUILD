# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-print-color
_name=print-color
pkgver=0.4.8
pkgrel=1
pkgdesc="Simple Python wrapper to print color messages in the terminal"
arch=('any')
url="https://github.com/xy3/print-color"
license=(Apache-2.0)
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xy3/print-color/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61177db716bb008e1b71f39b3410617e004589b95bac6edb9cc0a5c90f21241b')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
