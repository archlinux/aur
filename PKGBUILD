# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=aurdex
pkgver=0.0.9
pkgrel=1
pkgdesc="terminal interface for browsing AUR package metadata with GIT and comment views"
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
  python-beautifulsoup4
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envolution/auricle/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08ea04e555bcf7404e60dd67c2f1821d5effad86ec3be1d6361218a4fac3581e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
