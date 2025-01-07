# Maintainer: horix <houruinus@gmail.com>

pkgname=python-nashpy
_name="Nashpy"
arch=("any")
pkgver=0.0.41
pkgrel=1
pkgdesc="A python library for 2 player games"
url="https://github.com/drvinceknight/Nashpy"
source=("https://github.com/drvinceknight/Nashpy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("958c28eace070903be33e295b0025335798aeedb0d05e22484b80b4670990a90425835db6cc6cf008eedb466f4a4c10ae33e242327b8e0f4d49bed7c33ac9941")

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
