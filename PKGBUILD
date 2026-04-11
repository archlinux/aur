# Maintainer: Atanas Lambov <am.lambov@gmail.com>
pkgname=wondershaper-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="A professional graphical user interface for the wondershaper CLI tool"
arch=('any')
url="https://github.com/am-lambov/wondershaper-gui"
license=('MIT')
depends=('wondershaper' 'tk' 'python' 'polkit')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e16514d4745b1ee27329bcec3c3e1577ba8fb01ef85b381123274920f1509f7a')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
