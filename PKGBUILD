# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.4.0
pkgrel=1
pkgdesc='An audio tag editor for GNU/Linux'
url="https://docs.${pkgname}.net/"
license=('GPL-3.0-or-later')
arch=('any')
depends=('python-configobj'
         'python-distro'
         'python-mutagen'
         'python-pyparsing'
         'python-pyqt5'
         'python-unidecode'
         'qt5-svg')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('chromaprint: AcoustID support'
            'python-levenshtein: faster duplicate matching'
            'python-lxml: additional tag sources' 
            'quodlibet: QuodLibet library support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puddletag/puddletag/archive/${pkgver}.tar.gz")
sha512sums=('a45d3586d6616cfa153fff52747aa7936368bbc56fd62c76e6f23d11fec9f089d801479f075002e77a4c79dcaf44ed567e81002d1d606670ef2a4ae09bb4219a')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
