# Maintainer: Evan Chen <evan@evanchen.cc>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-html-void-elements
_pkg="${pkgname#python-}"
pkgver=0.1.0
pkgrel=2
pkgdesc='List of HTML void tag names'
arch=('any')
url='https://github.com/djlint/html-void-elements'
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('931b88f84cd606fee0b582c28fcd00e41d7149421fb673e1e1abd2f0c4f231f0')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
