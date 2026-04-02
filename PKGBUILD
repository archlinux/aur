# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-config
_module=${pkgname#python-}
pkgver='0.4.1'
pkgrel=1
pkgdesc="Round-trip parser and editor for Hyprland configuration files"
url="https://github.com/BlueManCZ/hyprland-config"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b9e1cf8db970a8134fab230a6ba2f9d3d70d9e04487b5bc08ded4a8e0167b145')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
