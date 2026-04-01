# Maintainer: bag-man <garland.owen@gmail.com>
pkgname=airohunt-ng
pkgver=1.0.5
pkgrel=1
pkgdesc="802.11 monitor-mode Wi-Fi signal tracker with terminal UI"
arch=('any')
url="https://github.com/bag-man/airohunt-ng"
license=('GPL-3.0-or-later')
depends=('python' 'tcpdump' 'iw')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e5303f5cf6c0e5e7d400580e618953e7658896aec592f3e7232365c043813bd')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
