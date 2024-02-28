_name=setuptools-protobuf
pkgname=python-setuptools-protobuf
pkgver=0.1.12
pkgrel=1
pkgdesc="Plugin for setuptools that adds support for compiling protobuf files."
arch=('any')
url="https://github.com/jelmer/$_name"
license=('APACHE')
depends=(python python-setuptools)
makedepends=(python-build python-installer python-wheel)
optdepends=(python-mypy-protobuf)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8d68bfde3986deca93e2859f6095c66142704307429f75a3e5a829c2ffe042ec03d02bc3b48489b0fc303ef97fbfea9cb31343d8bfdbbf6c47527d01e4c6e10d')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
