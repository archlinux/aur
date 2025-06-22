# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=auricle
pkgver=0.0.2.1
pkgrel=1
pkgdesc="terminal interface for browsing AUR package metadata with GIT exploration"
arch=(any)
url="https://github.com/envolution/auricle"
license=(Apache-2.0)
depends=(
  pyalpm
  python
  python-textual
  python-rich
  python-pygit2
  python-appdirs
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envolution/auricle/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c7b42e668375d776fb254cee10c4467c10d4327724b4eceafaccb518ce4426c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
