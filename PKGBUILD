# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=the0-bin
pkgver=1.25.0
pkgrel=1
pkgdesc="Open-source algorithmic trading engine"
arch=('x86_64' 'aarch64')
url="https://github.com/alexanderwanyoike/the0"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alexanderwanyoike/the0/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/the0-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/the0-linux-arm64")
sha256sums=('1c098e124c5d0368cbaaaac3038d90ab834881b8dec8ee04b4ad39a3035c4792')
sha256sums_x86_64=('a68eeb239a9f5e99f108e1d15417635683edcb81afcf57a829ed90ffbcfdd0ec')
sha256sums_aarch64=('51b00fdbe9915935ebceb99df84694f08a9b36d47d683cfe2015d10f3ae91a9c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/the0"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
