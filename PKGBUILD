# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=youta-bin
pkgver=1.25.7
pkgrel=1
pkgdesc="An audio player for YouTube, Yandex Music, podcasts, audiobooks, radio, and local files"
arch=('x86_64' 'aarch64')
url="https://github.com/vitaly-zdanevich/youta"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vitaly-zdanevich/youta/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/youta-${pkgver}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/youta-${pkgver}-linux-arm64")
sha256sums=('40c6322f9ff7ec63f0c23e61a7b9d0d72eb83ca27d468a4704539d6ffbe6e4d5')
sha256sums_x86_64=('0e98f65d1f1ab8ee73aa757d63e68d83bcf93894067150e0338188aa1927ff7f')
sha256sums_aarch64=('7d8fc247ac0900931e305f6dba0827845718a39f28511f566b51548e7ced79b8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/youta"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
