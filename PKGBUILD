# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=epusdt-bin
pkgver=2.1.7
pkgrel=1
pkgdesc="GM Pay(formerly known as EPUSDT)"
arch=('x86_64' 'aarch64')
url="https://github.com/GMWalletApp/epusdt"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/GMWalletApp/epusdt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/epusdt-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/epusdt-${pkgver}-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('fbd2150c73508d922a9e58af4fb700ef9e4930ca0a49a8a98e0e22cf206e822b')
sha256sums_aarch64=('be6f17a27b8be16b1d3c6ca7d79f7baa06c37826bc6011dd20d0fee1fdc8d661')

package() {
  install -Dm755 "epusdt" "${pkgdir}/usr/bin/epusdt"
  install -Dm755 "chainscanner" "${pkgdir}/usr/bin/chainscanner"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
