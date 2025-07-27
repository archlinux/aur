# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.5.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('05190c3c03d25bde1c247929fa76036a1975565ca22484cfff195a0921310bcb1bbcbf254f69d96811866e900e81193040cd2a853c5301acbb8d0fe783f9e6ba')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
