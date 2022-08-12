# Maintainer: horix <houruinus@gmail.com>

pkgname=python-nashpy
_name="Nashpy"
arch=("any")
pkgver=0.0.35
pkgrel=1
pkgdesc="A python library for 2 player games"
url="https://github.com/drvinceknight/Nashpy"
source=("https://github.com/drvinceknight/Nashpy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("1681509c9a2e18d3a706862825006e4fed0fcc6f1096c01d539dc58c70246021265df035f5e98d36a44a82b43fe8804511dd5c391a87b7c66fecf14af1c66671")

depends=(python)
makedepends=(python-build python-installer python-wheel python-flit-core)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
