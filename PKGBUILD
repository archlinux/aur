# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types_markdown
pkgver=3.10.2.20260712
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('9998c8de38c88208ada880dc004123228209e42d3234c42f6a38ae964f1dffc511f348c1fbc191024a6cb876746fc9c8aa7ad18e38d1d89b8e9e21717786f788')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
