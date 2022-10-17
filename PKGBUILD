# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=1.7.2
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00512f4bc44c4674175dc3b49b55e7342920bc0c17555d367858c6c14df39b61')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
