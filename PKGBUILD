# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=python-pybricks
_name=pybricks
pkgver=4.0.0
pkgrel=1
pkgdesc="Pybricks API type stubs and documentation for MicroPython on LEGO hubs"
arch=('any')
url="https://github.com/pybricks/pybricks-api"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8901de69884c1982b85f3cabef647b68df6efc52470b41326ab713031b1d35d5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
