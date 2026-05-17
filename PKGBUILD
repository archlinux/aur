pkgname=python-helium
pkgver=0.1.0
pkgrel=2
pkgdesc="A layer-shell framework written in C++, configured in Python"
arch=('x86_64')
url="https://github.com/xZepyx/helium"
license=('GPL3')
depends=('python' 'gtk4' 'gtk4-layer-shell' 'pybind11' 'nlohmann-json')
makedepends=('meson' 'python-build' 'python-installer')
source=("https://github.com/xZepyx/helium/archive/main.tar.gz")
sha256sums=('SKIP')
build() {
  cd helium-main
  python -m build --wheel --no-isolation
}
package() {
  cd helium-main
  python -m installer --destdir="$pkgdir" dist/*.whl
}
