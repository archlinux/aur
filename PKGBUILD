# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.1.1
pkgrel=1
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
sha512sums=('b05ab8a09d5ad4d21f8384fa85beebe039b8ee7e775630a23981bfe88ac389fc34a6ac6eac6660a99f38e34157e6bd841ba12237f45e290fe96ded3ab6d44d77')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py config
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
