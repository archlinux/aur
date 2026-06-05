# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-pinecone
pkgver=9.1.0
pkgrel=1
pkgdesc="Python Pinecone client and SDK"
arch=(x86_64 aarch64)
url="https://github.com/pinecone-io/pinecone-python-client"
license=(Apache-2.0)
depends=(python-httpx python-h2 python-msgspec python-orjson)
makedepends=(python-build python-installer python-wheel python-maturin protobuf-c)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9e3aa6e5b4342c8c2cc8d5833494b319980295a8263fd8c9025203e3bc3a6c8f3f17cf27d1413cbcf85e8d2820703ae7deaae0c82c87210583e86f0ae6b8beb9')

build() {
    cd "python-sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "python-sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
