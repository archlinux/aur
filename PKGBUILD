# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types_markdown
pkgver=3.10.0.20251106
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('12836f7fcbd7221db8baeb0d3a2f820b95050d0824bfa9665c67b4d144a1afa1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
