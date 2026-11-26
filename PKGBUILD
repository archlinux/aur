# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=parakeet-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Whisper-compatible speech recognition server using NVIDIA Parakeet"
arch=('x86_64' 'aarch64')
url="https://github.com/achetronic/parakeet"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/achetronic/parakeet/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/parakeet-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/parakeet-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('f879644b3859cac98202aa1b62bff9f93a711c059ebee10cb9fd90e197cb103b')
sha256sums_aarch64=('7f5fc2f0d00a916845485857687bbb4bd65214a07b747ece3868752d9e539b0a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/parakeet"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
