# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clawgod-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="ClawGod is a runtime patch applied to the official Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/0Chencc/clawgod"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/0Chencc/clawgod/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/clawgod-import-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/clawgod-import-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('dd2c994c86b7f2b50c6c439fdff69cbfbf711f7743749df27d240b6b1effe6d1')
sha256sums_aarch64=('737bf42a3a0dbfeeff41e9536005ce89a0f3b24b24c031f358281d27a58302d8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clawgod-import"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
