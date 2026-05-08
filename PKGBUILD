# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-config
_module=${pkgname#python-}
pkgver='0.4.5'
pkgrel=1
pkgdesc="Round-trip parser and editor for Hyprland configuration files"
url="https://github.com/BlueManCZ/hyprland-config"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce6bf791e4681df3515af768a8225d9d44b3dc84fb2e9eabded126955bda1bb8')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
