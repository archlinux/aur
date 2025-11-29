# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-spec-archivebox
pkgver=0.1.0
pkgrel=1
pkgdesc="The common shared interfaces for the ABX ArchiveBox plugin ecosystem."
arch=('any')
url="https://pypi.org/project/abx-spec-archivebox"
license=('MIT')
depends=('python' 'python-abx' 'python-abx-spec-abx-pkg' 'python-abx-spec-config' 'python-abx-spec-django' 'python-abx-spec-searchbackend')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx-spec-archivebox/abx_spec_archivebox-${pkgver}.tar.gz")
md5sums=('d2ce2f83a64664e8e4f5bb221f6ce5ea')

build() {
  cd "$srcdir/abx_spec_archivebox-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_spec_archivebox-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
