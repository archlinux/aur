# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.1.3
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://github.com/SpamScope/mail-parser
license=(Apache-2.0)
depends=(python-simplejson
         python-six)
makedepends=(python-setuptools)
provides=(python-mail-parser=${pkgver})
conflicts=("python-mail-parser")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('1a5534c3243d75e575355138176094fd99233b29fbed1f3a3788da90692bf2d85cd1f91ceefe830bad82a658feefe81b7114b61300da11ac08bbcbc55425233b')

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
