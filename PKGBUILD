# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-schema
_module=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc="Typed Python schema for every Hyprland configuration option"
url="https://github.com/BlueManCZ/hyprland-schema"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3a1ea6a1f783078a5198075a32f927ec977c6a0fcdadf6d5f6b5c59f20160154')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
