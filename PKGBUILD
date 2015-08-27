# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper
_pkgname=Ropper
pkgver=1.7.0
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
arch=('any')
url="https://github.com/sashs/Ropper"
license=('GPL2')
depends=('python-capstone')
optdepends=('sqlite: gadgets database support')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sashs/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('8615add56cba3b812a690c101732e02b8bd65a3ad90e65bcb40e3aeaa3c6b68e031bf5a89b8fb8fd39f5cd7e508041e31586f5e9f78ab892a91bc2d31c30025c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
