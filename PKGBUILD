# Maintainer: edoz90 <edoardo [dot] rosa90 [at] gmail [dot] com>

_pkgname=eml_parser
pkgname=python-eml-parser
pkgver=1.11.5
pkgrel=1
pkgdesc='Parse EML files and return various information found in the e-mail'
url='https://pypi.org/project/eml-parser'
arch=('x86_64')
license=('GPLv3')
depends=('python' 'python-chardet' 'python-dateutil')
source=(${pkgname}.tar.gz::"https://github.com/GOVCERT-LU/eml_parser/archive/v${pkgver}.tar.gz")
sha512sums=('ce999f418b738f824a5443a680381491a43a97f8a61ca0fea149c9e0caa382c5d5fa6c7f8fe59505d32e80d274f376be6796aba96dac7b69c2d67cd8260b537c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}
