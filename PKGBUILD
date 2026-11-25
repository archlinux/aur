# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=onwatch-bin
pkgver=2.14.17
pkgrel=1
pkgdesc="Track AI API quotas across providers in real time"
arch=('x86_64' 'aarch64')
url="https://github.com/onllm-dev/onWatch"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/onllm-dev/onWatch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/onwatch-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/onwatch-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('31f4a952c51f71fb1d0743585bae9574c978e338026d77f8e757e2f8c7b51852')
sha256sums_aarch64=('dd5f5314d582db14fc8361b566e8f1c43cbb6631f5e75a36c9e353312beed91d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/onwatch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
