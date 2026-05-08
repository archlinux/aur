# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-state
_module=${pkgname#python-}
pkgver=0.2.1
pkgrel=2
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('27e134c54ce0d7569ba3d22e053d8a0e495b97edfa96bed6c9e6b858bad35b4b')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
