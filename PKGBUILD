# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agav-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Terminal AI coding assistant for real repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/prapaa-ai/agav"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/prapaa-ai/agav/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64-agav::${_dl}/agav-linux-x64"
            "${pkgname}-${pkgver}-x86_64-agav::${_dl}/agav-linux-x64.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64-agav::${_dl}/agav-linux-arm64"
            "${pkgname}-${pkgver}-aarch64-agav::${_dl}/agav-linux-arm64.gz")
sha256sums=('04fc7cd47b2085b0fa51c6c4ada3586ea6b9dcb3ff4fe81f931f8a902af51961')
sha256sums_x86_64=('0decbe64f21d333078e1efa466a0d172b6787134f34abb64b51f4b0638a8a832'
                   '0decbe64f21d333078e1efa466a0d172b6787134f34abb64b51f4b0638a8a832')
sha256sums_aarch64=('f14fc1b9fca3ed46aef021b46ebfe17cc75274b1c09b18945c8e95705ea71189'
                    'f14fc1b9fca3ed46aef021b46ebfe17cc75274b1c09b18945c8e95705ea71189')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-agav" "${pkgdir}/usr/bin/agav"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
