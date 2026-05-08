# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-monitors
_module=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Monitor management utilities for Hyprland"
url="https://github.com/BlueManCZ/hyprland-monitors"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8be927879c198982ba68ba77a95146c22de9d7e1902a6648ecee107631e8ade3')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
