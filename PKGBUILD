# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=1.7
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9be64c73f684b037f3e5231a0f22eda28b09fc347ece31387773a189953cc9bc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
