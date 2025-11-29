# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-spec-abx-pkg
pkgver=0.1.1
pkgrel=1
pkgdesc="The ABX plugin specification for Binaries and BinProviders."
arch=('any')
url="https://pypi.org/project/abx-spec-abx-pkg/"
license=('MIT')
depends=('python' 'python-abx' 'python-abx-pkg' 'python-abx-spec-config')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx-spec-abx-pkg/abx_spec_abx_pkg-${pkgver}.tar.gz")
md5sums=('045de2166af3710b8fe4fc76a8b59881')

build() {
  cd "$srcdir/abx_spec_abx_pkg-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_spec_abx_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
