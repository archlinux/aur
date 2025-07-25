# Maintainer: mbutsk mbutsk@icloud.com
# Contributer: n0n1m

_name=aiomax
pkgname=python-$_name
pkgver=2.11.3
pkgrel=1
pkgdesc="Asynchronous framework for Max Bot API"
arch=('any')
url="https://github.com/dpnspn/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-git-versioning)
source=("https://codeload.github.com/dpnspn/aiomax/tar.gz/refs/tags/$pkgver")
sha256sums=('4715513520454ec34e8047949c3d99c7ebbce3d23b6ff0e35d95c32e4fc925c9')
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
