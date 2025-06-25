# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=aurdex
pkgver=0.0.3
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
  python-httpx
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envolution/auricle/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('497cf23c65b5ddb8821ee5da659d07fdcec11f6efd06c7e7726260eec9377070')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
