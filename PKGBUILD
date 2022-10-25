# Maintainer: André Klitzing <aklitzing@gmail.com>
pkgname=pydiffx
pkgver=1.1
pkgrel=1
pkgdesc="Python Reader/Writer for DiffX Files"
arch=('any')
url="https://diffx.org/pydiffx/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-setuptools python-six)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('0986dbb0a87cbf79e244e2f1c0e2b696d8e86b3861ea2955757a61d38e139228')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:
