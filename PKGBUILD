# Maintainer: edoz90 <edoardo [dot] rosa90 [at] gmail [dot] com>

_pkgname=eml_parser
pkgname=python-eml-parser
pkgver=1.11.6
pkgrel=1
pkgdesc='Parse EML files and return various information found in the e-mail'
url='https://pypi.org/project/eml-parser'
arch=('x86_64')
license=('GPLv3')
depends=('python' 'python-chardet' 'python-dateutil')
source=(${pkgname}.tar.gz::"https://github.com/GOVCERT-LU/eml_parser/archive/v${pkgver}.tar.gz")
sha512sums=('058ec2d5ddff6a323602655ceb04d4757690a90feb219ec73252f8f02a393fe22a3233e01f6ef2c8c1a94cf3816607d9b2a67e0a55b260b877047d462a9b23bf')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}
