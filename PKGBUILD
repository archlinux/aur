# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-socket
_module=${pkgname#python-}
pkgver=0.12.1
pkgrel=1
pkgdesc="Typed Python library for Hyprland IPC via Unix sockets"
url="https://github.com/BlueManCZ/hyprland-socket"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc8d25c6c4d9a6ae7452fb9d2173b753796340f3766a053f94daa036453dada6')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
