# Maintainer: Timo Wilken <aur@twilken.net>
pkgname=alidistlint
pkgver=1.0.2
pkgrel=1
pkgdesc='A code linter for ALICE build recipes at CERN'
arch=(any)
url='https://github.com/TimoWilken/alidistlint'
license=(GPL3)
depends=(shellcheck yamllint python-yaml python-cerberus)
makedepends=(python-build python-installer python-wheel)
optdepends=()
source=("https://github.com/TimoWilken/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7e1c4ca8855808e1cfdd7d853705e1f0c0fc1baae020d192e4ec207b7d9b6ff')

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
