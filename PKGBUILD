# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=dephpend
pkgver=0.8.0
pkgrel=1
pkgdesc="Detect flaws in your architecture, before they drag you down into the depths of dependency hell ..."
arch=('any')
url="https://github.com/mihaeu/dephpend"
license=('MIT')
depends=('php')
source=("https://github.com/mihaeu/dephpend/releases/download/${pkgver}/dephpend-${pkgver}.phar"
    "https://raw.githubusercontent.com/mihaeu/${pkgname}/${pkgver}/LICENSE")
sha256sums=('4918b32ee3df8c80af796ed1a074628c4df9fc4e35b5b73146cc91eccc397a3d'
            '8d08c4b8478e866b71ca32161d2c939991df9b8af62493f812f832b77e524c66')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/dephpend-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
