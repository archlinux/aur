# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.43
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python' 'python-docopt-ng')

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)

source=("mackup-${pkgver}.tar.gz::https://github.com/lra/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3d567abdc0f19f623f9f5627fcc3ab7c29ac5da516a8e79834bd873370d52dc4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=2 sts=2 sw=2 et:
