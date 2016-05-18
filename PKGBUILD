# Maintainer: Sebastian Krebs <sebastian@krebs.one>

pkgname=sculpin
pkgver=2.0.0
pkgrel=1
pkgdesc="Static Site Generator"
url="https://sculpin.io"
arch=("any")
license=("MIT")
depends=("php")
source=("https://download.sculpin.io/release/v${pkgver}/sculpin.phar"
        "https://raw.githubusercontent.com/sculpin/sculpin/v${pkgver}/LICENSE")
sha256sums=('0bb294c47bc1fc3612e8216826b1fd62f33217b4c74b07a1a8bcc98cbe7fab9e'
            'b5a5f0d4b7d96133e4ae75954569ecccf113629fc70faa38067868626ea99ed3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
