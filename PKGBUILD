# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dotenvx-bin
pkgver=2.38.2
pkgrel=1
pkgdesc="a secure dotenvfrom the creator of `dotenv`"
arch=('x86_64' 'aarch64')
url="https://github.com/dotenvx/dotenvx"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dotenvx/dotenvx/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dotenvx-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dotenvx-linux-arm64.tar.gz")
sha256sums=('2edeb009148c36c249712564871d8297d92094b88e417228e4f3ce7db59ee9ed')
sha256sums_x86_64=('37d8e26600b707e4ec450b1ab57571159f6ac39be736b04886a0fcc66527a1bb')
sha256sums_aarch64=('cb0bb6e4cf3ff5ae7be8489d91ee14d1db302be20c531bfc4e18e5ff9207be3b')

package() {
  install -Dm755 "./dotenvx" "${pkgdir}/usr/bin/dotenvx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
