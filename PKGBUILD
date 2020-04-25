# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-sphinxcontrib-svg2pdfconverter
pkgver=1.0.1
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
sha256sums=('3ee4d762b38df81fdbfb09f67ac35eb866ca4622705e0c40b6e03c3d876c66f6')

build() {
  cd "${srcdir}/sphinxcontrib-svg2pdfconverter-${pkgver}"
  python setup.py build
}

package() {

  cd "sphinxcontrib-svg2pdfconverter-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
