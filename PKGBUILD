# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-config
_module=${pkgname#python-}
pkgver=0.9.10
pkgrel=1
pkgdesc="Round-trip parser and editor for Hyprland configuration files"
url="https://github.com/BlueManCZ/hyprland-config"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a4ece2800021601ee260cae724b3205115c09a556645f6b69ff53de54c96a74a')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
