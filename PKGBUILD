# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx
pkgver=0.1.0
pkgrel=1
pkgdesc="The common shared interfaces for the ABX ArchiveBox plugin ecosystem."
arch=('any')
url="https://pypi.org/project/abx"
license=('MIT')
depends=('python' 'python-benedict' 'python-pluggy' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx/abx-${pkgver}.tar.gz")
md5sums=('0887c3aedff379bf93f1e39d198ce98d')

build() {
  cd "$srcdir/abx-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
