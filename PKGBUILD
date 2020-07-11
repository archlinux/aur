# Maintainer: edoz90 <edoardo [dot] rosa90 [at] gmail [dot] com>

_pkgname=eml_parser
pkgname=python-eml-parser
pkgver=1.14.1
pkgrel=0
pkgdesc='Parse EML files and return various information found in the e-mail'
url='https://pypi.org/project/eml-parser'
arch=('x86_64')
license=('GPLv3')
depends=('python' 'python-chardet' 'python-dateutil')
source=(${pkgname}.tar.gz::"https://github.com/GOVCERT-LU/eml_parser/archive/v${pkgver}.tar.gz")
sha512sums=('543f43eaf677259be341001a35021ad0327b92b952f817809cbcb3257994bf23b5e7488d752d6b3985b3913c02374d97c23a8da99eb5a76eed9b15c209326d77')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}
