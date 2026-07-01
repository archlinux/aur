# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-socket
_module=${pkgname#python-}
pkgver=0.12.2
pkgrel=1
pkgdesc="Typed Python library for Hyprland IPC via Unix sockets"
url="https://github.com/BlueManCZ/hyprland-socket"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3b26dba706560c411f0e71f689c6f8219a3ace0eabdad9c7f460058ee174c685')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
