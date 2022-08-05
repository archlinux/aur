# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-sphinxcontrib-svg2pdfconverter
pkgver=1.2.0
pkgrel=1
pkgdesc="Sphinx SVG to PDF converter extension"
arch=('any')
url='https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter'
license=('BSD')
depends=('python-sphinx')
makedepends=('python-pip')
optdepends=('librsvg: Use librsvg engine'
            'inkscape: Use inkscape engine'
            )
source=("https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/archive/v${pkgver}.tar.gz")
sha256sums=('295a93bb4e81751e7a3fb63cbe4ead43f9341cd94fa8c65f606a2cf454b79c85')

build() {
  cd "${srcdir}/sphinxcontrib-svg2pdfconverter-${pkgver}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${srcdir}/sphinxcontrib-svg2pdfconverter-${pkgver}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
