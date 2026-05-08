# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-schema
_module=${pkgname#python-}
pkgver='0.4.0'
pkgrel=1
pkgdesc="Typed Python schema for every Hyprland configuration option"
url="https://github.com/BlueManCZ/hyprland-schema"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8ccd7c79219ee52061aa2d4c77adb5efd0e1fb083a32b97e8805c25d7ebd848c')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
