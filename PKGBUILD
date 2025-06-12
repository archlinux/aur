# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-funk
_pkgname=funk
pkgver=0.5.0
pkgrel=2
pkgdesc="mocking framework influenced heavily by JMock"
arch=(any)
url="https://github.com/mwilliamson/funk"
license=(BSD-2-Clause)
depends=(python-installer python python-precisely)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwilliamson/funk/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fc33c7731bfbf84a8dff735c88b00de8ac02210f28f70f0e123396d5a23aa737')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
