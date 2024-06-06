# Maintainer: A. Klitzing <aklitzing@gmail.com>
_name=housekeeping
pkgname=python-${_name}
pkgver=1.1
pkgrel=2
pkgdesc="Housekeeping for Python"
arch=('any')
url="https://pypi.org/project/housekeeping/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-typing_extensions)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('75e71f1cc501885406f6be81410c9b05361871a3ecccde3891336da1e92426b5')

build() {
  cd "$srcdir/housekeeping-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/housekeeping-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

