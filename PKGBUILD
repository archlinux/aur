# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types-Markdown
pkgver=3.7.0.20240822
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('183557c9f4f865bdefd8f5f96a38145c31819271cde111d35557c3bd2069e78d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
