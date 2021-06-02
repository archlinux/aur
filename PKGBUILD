# Maintainer: edoz90 <edoardo [dot] rosa90 [at] gmail [dot] com>

_pkgname=eml_parser
pkgname=python-eml-parser
pkgver=1.14.6
pkgrel=0
pkgdesc='Parse EML files and return various information found in the e-mail'
url='https://pypi.org/project/eml-parser'
arch=('x86_64')
license=('GPLv3')
depends=('python' 'python-chardet' 'python-dateutil')
source=(${pkgname}.tar.gz::"https://github.com/GOVCERT-LU/eml_parser/archive/v${pkgver}.tar.gz")
sha512sums=('405efae7a3186fb89d6545284aa9b2d49e786c0f5f323e0cf106e4f7774237857fac7305f3a54f71e4fda0fdd14141f6bb2129d4c98e624a5ed7a4868c78b73b')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}
