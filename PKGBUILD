# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=absotui-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="A fast, keyboard-driven TUI client for Audiobookshelf (self-hosted audiobook/podcast server)"
arch=('x86_64' 'aarch64')
url="https://github.com/pdwaldrop/absotui"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pdwaldrop/absotui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/absotui-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/absotui-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('441b2be2de7bcfb1f4f55386c03f1556bcbbd3f704c2c26e58e6112fab6c2426')
sha256sums_aarch64=('67a5e3a6cf249532effb8f0dccf3a6f44562699e97a28cec1556392858df7985')

package() {
  install -Dm755 "absotui" "${pkgdir}/usr/bin/absotui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
