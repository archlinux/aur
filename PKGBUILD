# Maintainer: Yousif Haidar <asd22.info@gmail.com>
pkgname=python-rocketui
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast Qt6-based UI Framework for Python."
arch=('any')
url="https://github.com/neoapps-dev/RocketUI"
license=('GPL')
depends=(
  'python'
  'pyside6'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

