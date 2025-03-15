# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-sphinxcontrib-svg2pdfconverter
pkgver=1.3.0
pkgrel=1
pkgdesc="Sphinx SVG to PDF converter extension"
arch=('any')
url='https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter'
license=('BSD')
depends=('python-sphinx')
makedepends=(
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'python-build'
)
optdepends=(
  'librsvg: Use librsvg engine'
  'inkscape: Use inkscape engine'
)
source=("https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/archive/v${pkgver}.tar.gz")
sha256sums=('c56607a1423811ab479171db1059ffd81f63a5c15cf98ad07ffdcece7e340fb6')

build() {
  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
