pkgname=vskui
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python widget framework for Hyprland"
arch=('any')
url="https://github.com/vskksa/vskui"
license=('LGPL-2.1-only')
depends=(
    'python>=3.11'
    'gtk4'
    'gtk4-layer-shell'
    'python-gobject'
    'hyprland'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
