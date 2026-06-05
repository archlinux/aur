# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.3.0
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
sha512sums=('2a89b45fd48117d83849b78a0ede3bc246c199df021e08a8c830af26d81ce20ff38edfede2de56bc724729872cfaef51efa20f46ea0eebd52303dad3b9affc02')

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
