# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.12.0
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache-2.0)
depends=(python-simplejson
         python-six)
makedepends=(uv python-setuptools)
provides=(python-mail-parser=${pkgver})
conflicts=("python-mail-parser")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('c9a515c1f7504c168b8515d64945ab12d26d9c2504334bb58322d60a7ea2c52d26d85a3536f1a709558db6b594186ea17317991705dca96be45559f8fc31dbf8')

build() {
  cd mail-parser-${pkgver}
  uv sync
  #python setup.py build
}

package() {
  cd mail-parser-${pkgver}
  #python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
