# Maintainer: Francesco <francesco19772509@users.noreply.github.com>

pkgname=openthermalright
pkgver=1.1.1
pkgrel=1
pkgdesc="Linux application for controlling Thermalright USB displays"
arch=("any")
url="https://github.com/francesco19772509-del/OpenThermalright"
license=("GPL-3.0-only")
depends=(
  "python"
  "pyside6"
  "python-psutil"
  "python-pyusb"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('beb624cdf00b9cfc81d51f33af9b862b4edb902580fc8ef1b6bd46d4e84170b3')

build() {
  cd "OpenThermalright-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "OpenThermalright-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
