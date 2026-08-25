# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-monitors
_module=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Monitor management utilities for Hyprland"
url="https://github.com/BlueManCZ/hyprland-monitors"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b999f2f5c613530464ad8aead28c65b077904076e19257726b28b490fea47018')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
