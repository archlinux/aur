# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=undercut-f1-bin
pkgver=4.0.105
pkgrel=1
pkgdesc="F1 live timing TUI with delay to sync with your TV"
arch=('x86_64' 'aarch64')
url="https://github.com/justaman62/undercut-f1"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/justaman62/undercut-f1/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/undercutf1-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/undercutf1-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('878adab9445f0f39592bee94f99e40cee8186dce853ce3857ee9d9e0bab0b741')
sha256sums_aarch64=('bce8cc0a0fb0c138e32dc8080351d25c127a41154135223ea6e15d6b67d6e872')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/undercutf1"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
