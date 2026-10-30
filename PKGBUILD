# Maintainer: Eric Busch <me@etbus.ch>
_name=libpebble2
pkgname=python-libpebble2
pkgver=0.0.32
pkgrel=1
pkgdesc="Library for communicating with Pebble smartwatches over the Pebble protocol"
arch=('any')
url="https://github.com/pebble-dev/libpebble2"
license=('MIT')
depends=('python' 'python-websocket-client' 'python-pyserial' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/2f/41/6cdcb83065c5ac3be1a5963fe1533905e6e8f0398213f10a03898d403764/$_name-$pkgver.tar.gz")
sha256sums=('405f63341e34f43f7732bd6de5410312035076bbd1b397f0ead78df2f997bae0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
