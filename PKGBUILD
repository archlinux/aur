# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 

pkgname=puddletag
pkgver=2.3.0
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
sha512sums=('7058526dfe0132bf8edc260538a18c3c169128162ad83646557e166af0bcb23166053de15e02d13eb84c2d68bdbc8bacd6a6730ade409ab34f8503ec9d69af46')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
