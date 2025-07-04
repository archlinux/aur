# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name-autotest
pkgver=2.7.3
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/n0n1m/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$_name::https://codeload.github.com/n0n1m/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('3805adbf2f4c22ae8409077dd879de9786a3b5ad5ce6539046f2664581d03628')
conflicts=(python-aiomax-git)

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
