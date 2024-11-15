_name=setuptools-protobuf
pkgname=python-setuptools-protobuf
pkgver=0.1.13
pkgrel=1
pkgdesc="Plugin for setuptools that adds support for compiling protobuf files."
arch=('any')
url="https://github.com/jelmer/$_name"
license=('APACHE')
depends=(python python-setuptools)
makedepends=(python-build python-installer python-wheel)
optdepends=(python-mypy-protobuf)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('cc271b236d298d0ed4b2a13bb70f1185ff0a9cbb4e191ea909d5472d3c569fdbec847f4d69063c9a05cee74474b5e0b3fa0c648f1457a0d711c8d1060e1d661f')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
