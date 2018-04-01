# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=dephpend
pkgver=0.5.0
pkgrel=1
pkgdesc="Detect flaws in your architecture, before they drag you down into the depths of dependency hell ..."
arch=('any')
url="https://dephpend.com/"
license=('MIT')
depends=('php')
source=("https://github.com/mihaeu/dephpend/releases/download/${pkgver}/dephpend.phar"
    "https://raw.githubusercontent.com/mihaeu/${pkgname}/${pkgver}/LICENSE")
sha256sums=('cf3dbcec000712246a5395b3562e16f05cffb4c519897d4a9af1bee9439f6703'
    '2025717a285cf18f45e9a41ea41971b56f5a1692ce5ee03bb6c862514aadc97d')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/dephpend.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
