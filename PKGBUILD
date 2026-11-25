# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=portr-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Expose local http, tcp or websocket connections to the public internet"
arch=('x86_64' 'aarch64')
url="https://github.com/amalshaji/portr"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/portr_${pkgver}_Linux_x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/portr_${pkgver}_Linux_arm64.zip")
sha256sums_x86_64=('b5068ed77ab981764c5085be96a08bc830c4086511c97398ce2f075c3d5b2c33')
sha256sums_aarch64=('87aed4e3d2c8b59429b4577e85161810319675248138b9a4148aa68ee0f8b982')

package() {
  install -Dm755 "portr" "${pkgdir}/usr/bin/portr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
