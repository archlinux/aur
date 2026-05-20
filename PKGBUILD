# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-monitors
_module=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Monitor management utilities for Hyprland"
url="https://github.com/BlueManCZ/hyprland-monitors"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0e2ef4417c01b83068ae5e90ccf5d96abd3e85d8a9cdd158bd5cd6c5aabc094e')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
