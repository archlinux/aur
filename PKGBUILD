# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-sphinxcontrib-svg2pdfconverter
pkgver=1.2.2
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
sha256sums=('bdaca33b740261cbff41519ecbd2791c59d33b403f366636fc4f912213abe05c')

build() {
  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
