# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joel Almeoda <aullidolunar at gmail d0t c0m>

pkgname=qualcoder
_pkgname=QualCoder
pkgver=3.0
pkgrel=1
pkgdesc="Qualitative data analysis for text, images, audio, video. Cross platform. Python 3.6 or newer and PyQt6."
arch=('any')
url='https://github.com/ccbogel/QualCoder'
license=('MIT')
depends=('python-pyqt6'
         'python-lxml'
         'python-pillow'
         'python-ebooklib'
         'python-pdfminer'
         'python-ply'
         'python-chardet'
         'python-openpyxl'
         'python-pandas'
         'python-plotly'
         'python-pydub'
         'python-speechrecognition')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://github.com/ccbogel/QualCoder/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

