# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=takatime-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="Privacy-first, self-hosted coding activity tracker"
arch=('x86_64')
url="https://github.com/Rtarun3606k/TakaTime"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Rtarun3606k/TakaTime/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64-taka-dashboard::${_dl}/taka-dashboard-linux-amd64"
            "${pkgname}-${pkgver}-x86_64-taka-export::${_dl}/taka-export-linux-amd64"
            "${pkgname}-${pkgver}-x86_64-taka-report::${_dl}/taka-report-linux-amd64"
            "${pkgname}-${pkgver}-x86_64-taka-upload::${_dl}/taka-upload-linux-amd64")
sha256sums=('5976bfe8bd52fcc3402b2a8089dced88ba6a319c3ea5f13db420c5fde368c53b')
sha256sums_x86_64=('fc7141c4d8259e2b22bed824684b84bd29790ae602ad3006d3e13fd952617146'
                   '7327422e8791fbe1b38dcd94f7b8c8abe2b71c6a32ec500cd16fadda6a8088e1'
                   '0163cdc3a444104a128a652a4ac5468b1d52eeb0200380616112498acede2a4e'
                   '88011ea2c5105d6cd099291c97eff91c6e991f0d36ed2a5d72fd75652f724e41')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-taka-dashboard" "${pkgdir}/usr/bin/taka-dashboard"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-taka-export" "${pkgdir}/usr/bin/taka-export"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-taka-report" "${pkgdir}/usr/bin/taka-report"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-taka-upload" "${pkgdir}/usr/bin/taka-upload"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
