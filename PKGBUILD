# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.0.1
pkgrel=3
pkgdesc='An audio tag editor for GNU/Linux'
url="https://docs.puddletag.net/"
license=('GPL3')
arch=('any')
depends=('python-configobj'
         'python-mutagen'
         'python-pillow'
         'python-pyparsing'
         'python-pyqt5'
         'qt5-svg')
optdepends=('chromaprint: AcoustID support'
            'quodlibet: QuodLibet library support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puddletag/puddletag/archive/${pkgver}.tar.gz")
sha256sums=('cd280ff0ea5c6b9837d8e90d15a3fc762d369dd71c0a54ea33889ea33de32c59')

build() {
  cd "${pkgname}-${pkgver}/source"
  python setup.py config
}

package() {
  cd "${pkgname}-${pkgver}/source"
  python setup.py install --root="${pkgdir}" --optimize=1
}
