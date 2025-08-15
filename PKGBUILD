# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-types-markdown
_name=types_markdown
pkgver=3.8.0.20250809
pkgrel=1
pkgdesc='Typing stubs for Markdown'
arch=(any)
url=https://github.com/python/typeshed
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa619e735878a244332a4bbe16bcfc44e49ff6264c2696056278f0642cdfa223')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
