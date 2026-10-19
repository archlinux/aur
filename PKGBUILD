# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.8.0
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
sha512sums=('6c42fc491390151e9233c6a2e7ee55d05de6e595e274d70442ef685e11136c6bcacfdfd9080376068e22bff026882ebd35780b22369b6d57f568e6423b598380')

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
