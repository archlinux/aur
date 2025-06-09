# Maintainer: Dessa Simpson <dxs@k7dxs.net>

pkgname=python-jinja2_getenv_extension
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="A jinja2 extension to access to system environment variables"
arch=('any')
url="https://github.com/metwork-framework/jinja2_getenv_extension"
license=('BSD-3-Clause')
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($pkgname-$pkgver.tar.gz::https://github.com/metwork-framework/$_name/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6c4f41c67df840e128f02a9266c5e6b515429ea685d94e844d99d84d8702b5d0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

