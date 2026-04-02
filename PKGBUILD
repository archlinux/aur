# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-socket
_module=${pkgname#python-}
pkgver='0.9.1'
pkgrel=1
pkgdesc="Typed Python library for Hyprland IPC via Unix sockets"
url="https://github.com/BlueManCZ/hyprland-socket"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3382c5d89200583102d88972d0df9ac4be3c6a90704555439ee9d34978e1bba1')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
