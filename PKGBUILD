# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=python-poetry-plugin-pre-commit
pkgver=0.1.2
pkgrel=1
pkgdesc="A Poetry plugin for automatically installing git pre-commit hooks whenever pre-commit is specified as a dependency of the project."
url=https://github.com/vstrimaitis/poetry-pre-commit-plugin
license=(GPL3)
depends=(
  python
  python-poetry
)
makedepends=(
  git
  python-build
  python-installer
)
source=(https://github.com/vstrimaitis/poetry-pre-commit-plugin/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('e18ea991b36d0fe84b5b991f30767e940922ef262d9508de581604488ae90c32')
arch=(any)

build() {
  cd poetry-pre-commit-plugin-${pkgver}
  python -m build -wn
}

package() {
  cd poetry-pre-commit-plugin-${pkgver}
  python -m installer -d "${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-poetry-plugin-pre-commit/
}

