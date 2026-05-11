# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=python-hyprland-schema
_module=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Typed Python schema for every Hyprland configuration option"
url="https://github.com/BlueManCZ/hyprland-schema"
depends=('python' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6588640ce483d08effdb04dfb88250d35bd7887bd5c36f05498ed6d9539730be')

build() {
  cd "$_module-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_module-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
