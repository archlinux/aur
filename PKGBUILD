# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=1.8.0
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d96f6e4b107e274c901a4b963914393d1e36378511a8f2f701a6c91860ed241a542ea71362d111659549d49be2a443fb9195bef1f7824c5964b690bcb41ac33a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
