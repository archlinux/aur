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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
