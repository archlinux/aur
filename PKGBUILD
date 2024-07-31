# Maintainer: Luke Yeager <lyeager@nvidia.com>
pkgname='python-bacpypes3'
_name=BACpypes3
pkgver=0.0.97
pkgrel=2
pkgdesc='BACnet communications library'
arch=(any)
url='https://github.com/JoelBender/bacpypes3'
license=(MIT)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/JoelBender/bacpypes3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(9500621249f8c7129dd7477a4b1f5036dc10fe8cd30bed1013f0bdef3aa92ca5)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}
package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
