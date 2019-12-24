# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=dephpend
pkgver=0.6.2
pkgrel=1
pkgdesc="Detect flaws in your architecture, before they drag you down into the depths of dependency hell ..."
arch=('any')
url="https://dephpend.com/"
license=('MIT')
depends=('php')
source=("https://github.com/mihaeu/dephpend/releases/download/${pkgver}/dephpend-${pkgver}.phar"
    "https://raw.githubusercontent.com/mihaeu/${pkgname}/${pkgver}/LICENSE")
sha256sums=('4ef6e10c52721caf3bad45fe1139a8b786536a73e6c9a71d0133f53a5f509723'
            '2025717a285cf18f45e9a41ea41971b56f5a1692ce5ee03bb6c862514aadc97d')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/dephpend-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
