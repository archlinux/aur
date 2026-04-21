# Maintainer: Ronald Nguyen <ronaldpham32766@outlook.com>

pkgname=python-mprisgovee
pkgver=1.3.2
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

sha256sums=('0645088c77577b1e48b4c49d57edb1c74c327387b237f248c74aaf0c043be8ed')

build() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

