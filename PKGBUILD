# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.40
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python' 'python-docopt')

makedepends=('python-build' 'python-installer' 'python-wheel')

source=("mackup-${pkgver}.tar.gz::https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4f9f984d265d0f0b2c7b3700cc9b36fe4366476ef7f3ea09d2ce90e14bdb2352')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=2 sts=2 sw=2 et:
