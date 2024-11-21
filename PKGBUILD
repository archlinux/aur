# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.1.2
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache-2.0)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
provides=(python-mail-parser=${pkgver})
conflicts=("python-mail-parser")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('1c6fe50a0f746900de98d7bbb3e3f9aca7047945a568774694426f9e411629ef7722f1e5e168c145de69f25f7dc48b9fab6fdb21908c8447901a40368e6a1430')

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
