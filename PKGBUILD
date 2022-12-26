# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types-Markdown
pkgver=3.4.2.1
pkgrel=00
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('03c0904cf5886a7d8193e2f50bcf842afc89e0ab80f060f389f6c2635c65628f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
