# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name
pkgver=2.8.0
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/dpnspn/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-git-versioning)
source=("$_name-$pkgver::https://codeload.github.com/dpnspn/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('e4a49b36a5005a1682ff02ab375e063edf30821e1f4982563374335bc3c06e08')
conflicts=(python-aiomax-git)

build() {
    cd $_name-$pkgver
    echo "$pkgver" > .version
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
