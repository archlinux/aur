# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=future-os-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="AI agent for the terminal and beyond"
arch=('x86_64' 'aarch64')
url="https://github.com/futuregene/future-os"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/futuregene/future-os/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/FutureOS_${pkgver}_linux_x86_64-cli.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/FutureOS_${pkgver}_linux_aarch64-cli.tar.gz")
sha256sums=('b20ef48ed582c0f4b39c29f81217fedfb0fd836c7bd7448eccf28fb27a2e786d')
sha256sums_x86_64=('7f307e2160166c2fa4a70bcecaa9c8b8aa02c771f4ca5d40b6cb0a4f5af51d2c')
sha256sums_aarch64=('092e7a4484f43a842618cc17d4e586e82a58357582b480da7806726549b5f172')

package() {
  install -Dm755 "future" "${pkgdir}/usr/bin/future"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
