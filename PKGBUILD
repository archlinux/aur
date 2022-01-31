# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.1.0
pkgrel=2
pkgdesc='An audio tag editor for GNU/Linux'
url="https://docs.${pkgname}.net/"
license=('GPL3')
arch=('any')
depends=('python-configobj'
         'python-lxml'
         'python-mutagen'
         'python-pillow'
         'python-pyparsing'
         'python-pyqt5'
         'qt5-svg')
optdepends=('chromaprint: AcoustID support'
            'quodlibet: QuodLibet library support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puddletag/puddletag/archive/${pkgver}.tar.gz")
sha512sums=('638c12be894d157d0456f336972f0064c4f4087d1c689f58b7b01f0e88cd773319b9c447e6f2b606f6e482b6d1e2328f5bc2aca556bab427b764d6525b8c2d5e')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py config
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
