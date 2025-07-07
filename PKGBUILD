# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=aurdex
pkgver=0.1.0
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
sha256sums=('c2fe2179bc5ae6c46cf54dce9529e56bb07f241d2259dc4a4567e093e97c7f8f')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
