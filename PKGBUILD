# Maintainer: bag-man <garland.owen@gmail.com>
pkgname=airohunt-ng
pkgver=1.0.3
pkgrel=1
pkgdesc="802.11 monitor-mode Wi-Fi signal tracker with terminal UI"
arch=('any')
url="https://github.com/bag-man/airohunt-ng"
license=('GPL-3.0-or-later')
depends=('python' 'tcpdump' 'iw')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
