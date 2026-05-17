pkgname=python-helium
pkgver=0.1.0
pkgrel=1
pkgdesc="A layer-shell framework written in C++, configured in Python"
arch=('x86_64')
url="https://github.com/xZepyx/helium"
license=('GPL3')
depends=('python' 'gtk4' 'gtk4-layer-shell' 'pybind11' 'nlohmann-json')
makedepends=('meson' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xZepyx/helium/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
build() {
  cd "$srcdir/helium-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/helium-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
