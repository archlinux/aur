# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-state
_module=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a045859ebac047488881cb1261bf3426336b77f7f72d6e6c2ecdd4098dd3b46b')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
