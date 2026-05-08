# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-socket
_module=${pkgname#python-}
pkgver=0.10.0
pkgrel=2
pkgdesc="Typed Python library for Hyprland IPC via Unix sockets"
url="https://github.com/BlueManCZ/hyprland-socket"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bdb63fa7cee7f30feafcd03976f15d232935ace6913acf3be43eff08e4fa31d9')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
