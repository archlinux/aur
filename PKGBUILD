# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.2.0
pkgrel=2
pkgdesc='An audio tag editor for GNU/Linux'
url="https://docs.${pkgname}.net/"
license=('GPL3')
arch=('any')
depends=('python-configobj'
         'python-mutagen'
         'python-pyparsing'
         'python-pyqt5'
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
sha512sums=('92c430f54b49d2f193ffc4168f35bbadb069ca9b41b28250ee1c6dcb84853def20865d6df52940eebff8c5b812c0c8ab6b8971b66d398ff9ac94918e955322bb')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
