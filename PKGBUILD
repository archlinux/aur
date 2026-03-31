# Maintainer: bag-man <garland.owen@gmail.com>
pkgname=airohunt-ng
pkgver=1.0.4
pkgrel=1
pkgdesc="802.11 monitor-mode Wi-Fi signal tracker with terminal UI"
arch=('any')
url="https://github.com/bag-man/airohunt-ng"
license=('GPL-3.0-or-later')
depends=('python' 'tcpdump' 'iw')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('68839c1bdbcde375c7f2abd22205bee09d8e392477ff4e74b4a5ceb77ac07199')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
