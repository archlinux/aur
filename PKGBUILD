# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-state
_module=${pkgname#python-}
pkgver='0.2.0'
pkgrel=1
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('250ec6ff7434edb186ea12202fbc81fc8d5b9b835e8ba1ee353ac9c675165a78')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
