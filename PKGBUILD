# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=contexere-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="One place for the skills, keys and memory of every AI agent you use"
arch=('x86_64' 'aarch64')
url="https://github.com/fajarhide/contexere"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fajarhide/contexere/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/omni-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/omni-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('419ae909fd086df7c94367a5473d22eaf260c7282c53d99767181882448090d1')
sha256sums_aarch64=('8e63b527b194dc0317a9cc0770dcbc7b6be0b3dbd6f380dbc73123db82d72ec8')

package() {
  install -Dm755 "contexere" "${pkgdir}/usr/bin/contexere"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
