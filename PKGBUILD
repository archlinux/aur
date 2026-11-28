# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tty2web-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Share your terminal as a web application"
arch=('x86_64')
url="https://github.com/kost/tty2web"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kost/tty2web/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tty2web_linux_amd64")
sha256sums=('e39bbc2f63ff573718a3a5b0eb793b42cb26a8b90d6bf3d6ef969c8754d0c532')
sha256sums_x86_64=('fa93ffcb57014769865e12ebf7e93350b89ba9509a35304d79f7358e880d10fa')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tty2web"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
