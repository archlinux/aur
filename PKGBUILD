# Maintainer: Evan Chen <evan@evanchen.cc>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-html-tag-names
_pkg="${pkgname#python-}"
pkgver=0.1.2
pkgrel=2
pkgdesc='List of known HTML tag names'
arch=('any')
url='https://github.com/djlint/html-tag-names'
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('04924aca48770f36b5a41c27e4d917062507be05118acb0ba869c97389084297')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
