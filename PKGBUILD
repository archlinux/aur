# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name
pkgver=2.12.4
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/dpnspn/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-git-versioning)
source=("https://codeload.github.com/dpnspn/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('1e1fbf49fe3a8198a4b44c945086c41ab646dc8f4666dba5860ed794e685743b')
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
