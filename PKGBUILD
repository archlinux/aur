# Maintainer: horix <houruinus@gmail.com>

pkgname=python-nashpy
_name="Nashpy"
arch=("any")
pkgver=0.0.43
pkgrel=1
pkgdesc="A python library for 2 player games"
url="https://github.com/drvinceknight/Nashpy"
source=("https://github.com/drvinceknight/Nashpy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("e9d9052970633255f3e2e87cb6237271b8aff0811a1ce79dcd154286a99314023caa143341659ca2b14c8643ffda12d361182230b254c862ec4c67296be6ab01")

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
