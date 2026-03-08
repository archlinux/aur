# Maintainer: Ronald Nguyen <ronaldpham32766@outlook.com>

pkgname=python-mprisgovee
pkgver=1.3.1
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

sha256sums=('28d8832d681cd20b53fee0ae09a78ac73c9767a13b83d16972b4240e8a599961')

build() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

