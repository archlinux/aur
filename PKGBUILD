# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=phive
pkgver=0.6.2
pkgrel=2
pkgdesc="The Phar Installation and Verification Environment (PHIVE)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.jetbrains.com/phpstorm/"
license=('BSD')
depends=("php")
source=("https://github.com/phar-io/phive/releases/download/${pkgver}/phive-${pkgver}.phar"
    "https://raw.githubusercontent.com/phar-io/phive/${pkgver}/LICENSE")
sha256sums=('778b7f6aa4f968148675015a099db27d85db0076d2f2dd0d9668f08f7471e6b2'
    '4c5d113b30cbdac7d303ca35b127620917eb4c0e7810d874dcf01e5496277d97')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
