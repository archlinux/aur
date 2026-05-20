# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-config
_module=${pkgname#python-}
pkgver=0.6.6
pkgrel=1
pkgdesc="Round-trip parser and editor for Hyprland configuration files"
url="https://github.com/BlueManCZ/hyprland-config"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('01a52f82721485dade74705fff7dc846f754b1027656126a4d0266f6ec5ce4e3')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
