# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chissl-bin
pkgver=2.4
pkgrel=1
pkgdesc="Create HTTPS reverse tunnels"
arch=('x86_64' 'aarch64')
url="https://github.com/unblocked/chissl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/chissl_Linux_x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/chissl_Linux_arm64.zip")
sha256sums_x86_64=('ebc6f3e97b4b99fd13db8d0e2876efe9791f8f50189407e16f18288bbf465c52')
sha256sums_aarch64=('66c02603b9934aff28138efc32f5fadcd32dca554a0bdfc6b3d22d8e2712c697')

package() {
  install -Dm755 "chissl" "${pkgdir}/usr/bin/chissl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
