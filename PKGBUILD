# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types_markdown
pkgver=3.8.0.20250708
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('28690251fe90757f5a99cd671c79502bc2de07aef2d35fe54117c3b1c799804a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
