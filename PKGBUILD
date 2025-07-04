# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name-autotest
pkgver=2.7.4.8
pkgrel=2
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/n0n1m/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$_name-$pkgver::https://codeload.github.com/n0n1m/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('a698c5a1ae33bca95433a878cfd47f780adbdbd4b8bb6a3df0298212bdbb67b8')
conflicts=(python-aiomax-git)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
