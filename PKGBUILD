# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arozos-bin
pkgver=2.025
pkgrel=1
pkgdesc="Web Desktop Operating System for low power platforms, Now written in Go!"
arch=('x86_64' 'aarch64')
url="https://github.com/tobychui/arozos"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tobychui/arozos/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/arozos_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/arozos_linux_arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('0f0db8992ecf47d60a844bbf2eaab2eb57b4f1f00adb3a4062ac963de9e3a9a5')
sha256sums_aarch64=('cf2f5901e5c36500dd1a3a8801eaebf22b46b15907e4c9a804909d65d3b4b6ac')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arozos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
