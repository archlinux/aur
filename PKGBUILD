# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-state
_module=${pkgname#python-}
pkgver=0.4.5
pkgrel=1
pkgdesc="Live state interface for Hyprland — options, animations, monitors, binds, and devices"
url="https://github.com/BlueManCZ/hyprland-state"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3def0394401a8a590889c97403a77fd9c144823934d125016217b82da05f8635')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
