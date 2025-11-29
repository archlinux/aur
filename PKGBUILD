# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-pkg
pkgver=0.6.0
pkgrel=1
pkgdesc="System package manager interfaces with Python type hints."
arch=('any')
url="https://pypi.org/project/abx-pkg/"
license=('MIT')
depends=('python' 'python-platformdirs' 'python-pydantic' 'python-pydantic-core' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx-pkg/abx_pkg-${pkgver}.tar.gz")
md5sums=('7a1fc9332c5007274111ac21c12bf05b')

build() {
  cd "$srcdir/abx_pkg-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
