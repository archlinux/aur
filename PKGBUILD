# Maintainer: foxinwinter <179904685+foxinwinter at users dot noreply dot github dot com>

pkgname=forager
pkgver=0.1.0
pkgrel=1
pkgdesc="Steam-like game launcher for your local game library"
arch=('any')
url="https://github.com/foxinwinter/forager"
license=('AGPL-3.0-only')
depends=('python' 'pyside6' 'python-evdev' 'python-keyring')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/foxinwinter/forager/archive/v${pkgver}.tar.gz")
sha256sums=('2bfaffba0dd5a6eb34380f59190da857d0d9afdc3ec004a9284859be23fd29fe')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
