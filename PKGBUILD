_name=setuptools-protobuf
pkgname=python-setuptools-protobuf
pkgver=0.1.6
pkgrel=1
pkgdesc="Plugin for setuptools that adds support for compiling protobuf files."
arch=('any')
url="https://github.com/jelmer/$_name"
license=('APACHE')
depends=(python python-setuptools)
makedepends=(python-build python-installer python-wheel)
optdepends=(python-mypy-protobuf)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('f6aa895ced19d634a84c92404326b64d1b5e7e57c4b025feb323e51e1e616cabba5bbbf1bf491ec8cc8fffbeb484eaa582352f261c4c7698b98b1835ea828d0e')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
