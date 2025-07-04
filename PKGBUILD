# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name-autotest
pkgver=2.7.4.9
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/n0n1m/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$_name-$pkgver::https://codeload.github.com/n0n1m/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('60e4a8f9660c47f31c3c1830fdcfb7f2d9a0a5746fa342381daea85a60c55f77')
conflicts=(python-aiomax-git)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
