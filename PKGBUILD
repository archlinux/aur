# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-python-tests
pkgver=0.3.0
pkgrel=2
pkgdesc='Osmocom tools for testing VTY/CTRL interfaces'
url='https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests'
license=('GPL')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/osmo-python-tests.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
