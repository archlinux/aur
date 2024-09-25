# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>

pkgname=mackup
pkgver=0.8.41
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python' 'python-docopt')

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core'
)

source=("mackup-${pkgver}.tar.gz::https://github.com/lra/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('963677bad7ee43336fc0213d5b019fb3aabe9fadbb79c4c8916ee9d06001ef08')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=2 sts=2 sw=2 et:
