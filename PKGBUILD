# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gymmane-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Offline gym log for Android"
arch=('x86_64' 'aarch64')
url="https://github.com/InlitX/GymMane"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/InlitX/GymMane/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gymmane-selfhost-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gymmane-selfhost-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('bb2389de2edf5a02e967beb73d68fad164db3cff72216ade61be3e0dfff816ee')
sha256sums_aarch64=('1b598bb1269541db5fcab374d453d88d8246684c7202a90a19d7f9fc44109ece')

package() {
  install -Dm755 "gymmane/gymmane-server" "${pkgdir}/usr/bin/gymmane-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
