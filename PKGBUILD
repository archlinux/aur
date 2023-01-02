# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-poetry-plugin-up
pkgver=0.2.1
pkgrel=1
pkgdesc="Poetry plugin that updates dependencies and bumps their versions in pyproject.toml file"
url="https://github.com/MousaZeidBaker/poetry-plugin-up"
license=('MIT')
depends=('python' 'python-poetry')
makedepends=('python-build' 'python-installer')
source=("https://github.com/MousaZeidBaker/poetry-plugin-up/archive/${pkgver}/poetry-plugin-up-${pkgver}.tar.gz")
sha256sums=('ba239be4b0939a86ed3b5776e6a11ddc22132c9e4018c0b73462a34aae50fc8d')
arch=('any')

build() {
  cd "poetry-plugin-up-${pkgver}"

  python -m build -wn
}

package() {
  cd "poetry-plugin-up-${pkgver}"

  python -m installer -d "${pkgdir}" dist/*.whl

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.rst"
}
