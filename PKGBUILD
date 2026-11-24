# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=feeling-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal mood tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/qiz-li/feeling"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/qiz-li/feeling/v${pkgver}/license")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/feeling-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/feeling-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('91e44552a7f7a14883bb60cb26592164dff3b7f90b6d7ee6640c3ce77d3bb020')
sha256sums_x86_64=('a725a3bea03ec235025f53d0b7fcd1251d63bffca1b31c7c65fb3fb31c346cbb')
sha256sums_aarch64=('74062f88b43b35089e6b0ddd442e8346acba4d06ba39c39e63ea36d25ba31888')

package() {
  install -Dm755 "feeling" "${pkgdir}/usr/bin/feeling"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
