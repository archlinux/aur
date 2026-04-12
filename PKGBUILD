# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types_markdown
pkgver=3.10.2.20260408
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d5cba15ed65a1420e80e31c17e3d4a2ad7208a3f3a4da97fd2c5f093caf523cd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
