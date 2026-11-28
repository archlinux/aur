# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cent-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Collect community Nuclei templates in one place"
arch=('x86_64' 'aarch64')
url="https://github.com/xm1k3/cent"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/cent_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/cent_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('e6b48946d578e54864a46ce3edf4a6f930d6349bbd3f8b3209d0ed2b1d7404a0')
sha256sums_aarch64=('4514b5b6282b3a50ffe686960d93b6f39a3edaf8598336a4ddfb6ee1b60a0ca3')

package() {
  install -Dm755 "cent" "${pkgdir}/usr/bin/cent"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
