# Maintainer: GGORG <me at ggorg dot xyz>
# Submitter: alufers <alufers[at]wp[dot]pl>

pkgname=python-datastruct
pkgver=2.0.0
pkgrel=1
pkgdesc='Combination of struct and dataclasses for easy parsing of binary formats'
url='https://github.com/kuba2k2/datastruct'
arch=('any')
license=('MIT')
depends=(
  'python>=3.8'
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=(https://github.com/kuba2k2/${pkgname#python-}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('019e6f4725aa340d9f6951948a67e842816552d5e8bc246f9db3149faa6c829e')
b2sums=('cbb4a4246e4b0db47f6e9a8de0bf95528ffa73be4abbc4b1377ab510534eefe2b7210dae758a9457642c46f53bf888869d67ecf61ee8c2fc0bdd78b0b9e14e3e')

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
