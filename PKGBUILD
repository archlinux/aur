# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-state
_module=${pkgname#python-}
pkgver=0.4.2
pkgrel=1
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('46b8b4777126a17c2c4e17a577930d470ace264f4b8130cb5ed39d7e6f46d274')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
