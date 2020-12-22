# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=phive
pkgver=0.14.5
pkgrel=1
pkgdesc="The Phar Installation and Verification Environment (PHIVE)"
arch=('any')
url="https://phar.io/"
license=('BSD')
depends=('php')
source=("https://github.com/phar-io/phive/releases/download/${pkgver}/phive-${pkgver}.phar"
        "https://raw.githubusercontent.com/phar-io/phive/${pkgver}/LICENSE")
sha256sums=('70d6de4afb2e4f66ff06e35434299f2a1d81d7ea3fec9c3359adb521c196ff8d'
            '28317aef20f67b09587c89df373ba45e5975312e490fa2606d3c59eae4af0733')


package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
