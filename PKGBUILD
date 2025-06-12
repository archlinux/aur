# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-tempman
_pkgname=tempman
pkgver=0.1.3
pkgrel=2
pkgdesc="Create and clean up temporary directories"
arch=(any)
url="https://github.com/mwilliamson/python-tempman"
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-setuptools python-installer python-build)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwilliamson/python-tempman/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('337801d67777af551710d5faa79c3d2f7a5cf4ac5dd90b10934d19be886f9e10')

build() {
  cd "$pkgname-$pkgver"
  touch README
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
