# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>
pkgname=python-mangum
_name=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc="AWS Lambda support for ASGI applications "
arch=(any)
url=https://github.com/Kludex/mangum
license=(MIT)
depends=(
)
optdepends=(
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
    python-hatchling-git
)
source=($_name-$pkgver.tar.gz::https://github.com/Kludex/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('0f0f8ce7a3f1ed1b7286b99f7beadf9be5261e608a1dca94d18a52c089c5c8fe72efaaa879a069f5001bb6dab482c0b11996a55a1825a8b8e0958fd06470c53d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

