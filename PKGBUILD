# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-monitors
_module=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Monitor management utilities for Hyprland"
url="https://github.com/BlueManCZ/hyprland-monitors"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2cc1cb07d67a1be701cc0a4b52cefb04b8d311d25d0e5d69ab9d330939b9205')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
