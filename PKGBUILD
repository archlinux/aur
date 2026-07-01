# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-schema
_module=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc="Typed Python schema for every Hyprland configuration option"
url="https://github.com/BlueManCZ/hyprland-schema"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c21d358d64dcd83459cd0e196f86b39d388568b5621a8c7800fa7032f6c4b34a')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
