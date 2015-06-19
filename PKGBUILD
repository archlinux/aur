# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper
_pkgname=Ropper
pkgver=1.6.2
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
arch=('any')
url="https://github.com/sashs/Ropper"
license=('GPL2')
depends=('python-capstone')
optdepends=('sqlite: gadgets database support')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sashs/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('cf91723bfa2065409f8b47e69b2b0bac8a490a592290649207e6fb5564d1e7868ba7cc83ec5fb37a0a3a6306e30f7ef115eb8ad10297b5c01921a26ac8baab8c')

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
