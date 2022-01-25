# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-sphinxcontrib-svg2pdfconverter
pkgver=1.2.0
pkgrel=1
pkgdesc="Sphinx SVG to PDF converter extension"
arch=('any')
url='https://github.com/sephalon/sphinxcontrib-svg2pdfconverter'
license=('BSD')
depends=('python-sphinx')
makedepends=('python-setuptools')
optdepends=('librsvg: Use librsvg engine'
            'inkscape: Use inkscape engine'
            )
source=("https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/archive/v${pkgver}.tar.gz")
sha256sums=('295a93bb4e81751e7a3fb63cbe4ead43f9341cd94fa8c65f606a2cf454b79c85')

build() {
  cd "${srcdir}/sphinxcontrib-svg2pdfconverter-${pkgver}"
  python setup.py build
}

package() {

  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
