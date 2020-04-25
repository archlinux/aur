# Maintainer: edoz90 <edoardo [dot] rosa90 [at] gmail [dot] com>

_pkgname=eml_parser
pkgname=python-eml-parser
pkgver=1.12.0
pkgrel=0
pkgdesc='Parse EML files and return various information found in the e-mail'
url='https://pypi.org/project/eml-parser'
arch=('x86_64')
license=('GPLv3')
depends=('python' 'python-chardet' 'python-dateutil')
source=(${pkgname}.tar.gz::"https://github.com/GOVCERT-LU/eml_parser/archive/v${pkgver}.tar.gz")
sha512sums=('2d0815e2094aa1cf9d526a18b1a684f5183fc3b691e937638d0e791e8ef77f8115abc4ae404f7b2be44ea2f229d0bde6e9165b110fbecf09457006d2bce690e1')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}
