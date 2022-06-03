# Maintainer: André Klitzing <aklitzing@gmail.com>
pkgname=pydiffx
pkgver=1.0.1
pkgrel=2
pkgdesc="Python Reader/Writer for DiffX Files"
arch=('any')
url="https://diffx.org/pydiffx/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-setuptools python-six)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('853216435008c23a0e2cd2c2a8ed15108bca449d6c31bc59d2e894246aff6bfa')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:
