# Maintainer: Ronald Nguyen <ronaldpham32766@outlook.com>

pkgname=python-mprisgovee
pkgver=1.1.7
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

sha256sums=('0444ed351da37e83e17269d57661f9e3b672b3567262953c256142d514dc2083')

build() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

