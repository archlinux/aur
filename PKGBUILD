# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=phive
pkgver=0.7.0
pkgrel=1
pkgdesc="The Phar Installation and Verification Environment (PHIVE)"
arch=('any')
url="https://phar.io/"
license=('BSD')
depends=('php')
source=("https://github.com/phar-io/phive/releases/download/${pkgver}/phive-${pkgver}.phar"
    "https://raw.githubusercontent.com/phar-io/phive/${pkgver}/LICENSE")
sha256sums=('6ae0a8294f4e0a0bc170b54fbb8e487e14474dc26ad11fe1004f91f69ac142ce'
    '4c5d113b30cbdac7d303ca35b127620917eb4c0e7810d874dcf01e5496277d97')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
