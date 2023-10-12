_name=setuptools-protobuf
pkgname=python-setuptools-protobuf
pkgver=0.1.10
pkgrel=1
pkgdesc="Plugin for setuptools that adds support for compiling protobuf files."
arch=('any')
url="https://github.com/jelmer/$_name"
license=('APACHE')
depends=(python python-setuptools)
makedepends=(python-build python-installer python-wheel)
optdepends=(python-mypy-protobuf)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('88e2b7e64f5865814077ce108e2208b068288359f031fa47a6039f2ad21a3677e58498fd3024952f183de403c022aabc8519c774a10c4f68aa857f782e4f90a7')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
