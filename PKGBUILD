# Maintainer: Ronald Nguyen <ronaldpham32766@outlook.com>

pkgname=python-mprisgovee
pkgver=1.2.0
pkgrel=1
pkgdesc="light anything up with govee, right from mpris."
arch=('any')
url="https://github.com/obvRedwolf/mprisgovee"
license=('MIT')

depends=(
    'python'
    'python-colorthief'
    'python-requests'
    'playerctl'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/obvRedwolf/mprisgovee/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('f3e43471a0f9d7970936b05d8f192d42d2e9b07b31cbfd18baa9d341190eb6d2')

build() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

