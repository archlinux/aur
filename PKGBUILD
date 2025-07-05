# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name-autotest
pkgver=2.7.4.10
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/n0n1m/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-git-versioning)
source=("$_name-$pkgver::https://codeload.github.com/n0n1m/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('df46db6608153c04e9dab606f39ed6f24b5977f26c1b2c62fc5f8ce363e2fb97')
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
