# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mailparser
pkgver=4.1.4
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
sha512sums=('96723b7871879cc1c4423906f180547ddd83100e95b9d2b6772944c891d2ffe6ebc467dd4e683f34781aaa9f6e8024698dcb1fb9c03cad853b0be6794dcbc9a4')

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
