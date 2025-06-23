# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=aurdex
pkgver=0.2.2.4
pkgrel=1
pkgdesc="terminal interface for browsing AUR package metadata with GIT exploration"
arch=(any)
url="https://github.com/envolution/aurdex"
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
sha256sums=('8d008baadec5e4172639fc6aa40fb156bade4bc6b349125d141e66801c9194e8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
