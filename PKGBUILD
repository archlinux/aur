# Maintainer: hafeoz <hafeoz@kolabnow.com>

pkgname=python-tgcrypto
_pkgname=tgcrypto
pkgver=1.2.5
pkgrel=1
pkgdesc="Fast and Portable Cryptography Extension Library for Pyrogram"
arch=("any")
url="https://github.com/pyrogram/$_pkgname"
license=("GPL3" 'LGPL3')
depends=("python" "python-pyaes" "python-pysocks")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-numpy")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("923c93bb93dc05f039278b132870f66ab19fdf8f07facce55d4e9f9af1e5c40c")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

