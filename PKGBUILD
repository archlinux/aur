# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zoro-bin
pkgver=20240828
pkgrel=1
pkgdesc="Expose a local server to the internet"
arch=('x86_64' 'aarch64')
url="https://github.com/txthinking/zoro"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/txthinking/zoro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/zoro_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/zoro_linux_arm64")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_x86_64=('3f50ac644088c429368ff3556c148845c7e72382ce578a34fb4ee388985996dd')
sha256sums_aarch64=('214c41bb0f2adfbbfdbb8a25497f0f4dc99010686901f5bb01c0f27b499f356c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zoro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
