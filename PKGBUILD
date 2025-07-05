# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=aurdex
pkgver=0.0.7
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
sha256sums=('b7ec27040b94613cff880a817d75477827d68e419f81a0c2b21f844d505aa2ff')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
