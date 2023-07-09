# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=3.15.0
pkgrel=3
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
provides=(python-mail-parser=${pkgver})
conflicts=("python-mail-parser")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('88f64a160ce88137e1c5b30690d1d3278145217454d856751bb9fc872bdfee4cdc924517c623f4b1d8f5ac5cda52e7c4f325807fd006baee652934f724e6952a')

build() {
  cd mail-parser-${pkgver}
  python setup.py build
}

package() {
  cd mail-parser-${pkgver}
  python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
