# Maintainer: Timo Wilken <aur@twilken.net>
pkgname=alidistlint
pkgver=1.0.1
pkgrel=1
pkgdesc='A code linter for ALICE build recipes at CERN'
arch=(any)
url='https://github.com/TimoWilken/alidistlint'
license=(GPL3)
depends=(shellcheck yamllint python-yaml python-cerberus)
makedepends=(python-build python-installer python-wheel)
optdepends=()
source=("https://github.com/TimoWilken/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22ce4f0730068e25018f8d0ed905784d57ae8dafdb4a577f96853de4645f8aff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #python -m unittest discover tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
