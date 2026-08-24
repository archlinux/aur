# Maintainer: Eric Busch <me@etbus.ch>
_name=libpebble2
pkgname=python-libpebble2
pkgver=0.0.31
pkgrel=1
pkgdesc="Library for communicating with Pebble smartwatches over the Pebble protocol"
arch=('any')
url="https://github.com/pebble-dev/libpebble2"
license=('MIT')
depends=('python' 'python-websocket-client' 'python-pyserial' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/69/ee/1271c5be045143e1957f8a67929848759391401d5fcb99f5cacf0b7cf38c/$_name-$pkgver.tar.gz")
sha256sums=('5567f1c2dd9586874e6f16a5340ba3ff88053cebc1fbda682942f8e2e9b6f4c9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
