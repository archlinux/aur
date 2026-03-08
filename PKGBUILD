# Maintainer: Ronald Nguyen <ronaldpham32766@outlook.com>

pkgname=python-mprisgovee
pkgver=1.1.0
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

sha256sums=('SKIP')

build() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mprisgovee-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('52732ff98edbafd87ab3cefa514d0e64068f4bb54cee491aea61775b9b67e19c')
