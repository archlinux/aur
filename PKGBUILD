# Maintainer: bag-man <garland.owen@gmail.com>
pkgname=airohunt-ng
pkgver=1.0.2
pkgrel=1
pkgdesc="802.11 monitor-mode Wi-Fi signal tracker with terminal UI"
arch=('any')
url="https://github.com/bag-man/airohunt-ng"
license=('GPL-3.0-or-later')
depends=('python' 'tcpdump' 'iw')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('edda1057152b7f4bc409993baaf99dd3239431dc065c793e51cd20bfc2bc9a95')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
