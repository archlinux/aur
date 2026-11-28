# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=logdeck-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Container log viewer and management UI"
arch=('x86_64' 'aarch64')
url="https://github.com/AmoabaKelvin/logdeck"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/AmoabaKelvin/logdeck/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/logdeck_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/logdeck_linux_arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('e0c07272344a2be49ef9eadc89a1f4754b3cfa3681862c39ca5c1de20ca94edc')
sha256sums_aarch64=('d8402d68829bccaa7b5cc1e4cadf46dea616f45a9bee1bfa8d6ff40644c8aa4e')

package() {
  install -Dm755 "logdeck" "${pkgdir}/usr/bin/logdeck"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
