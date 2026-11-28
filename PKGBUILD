# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=soppo-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Go with the features it is missing"
arch=('x86_64' 'aarch64')
url="https://github.com/halcyonnouveau/soppo"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/halcyonnouveau/soppo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sop-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sop-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ab81390470742b341fef74a0b901efa311439921d735d053bbb38f456c5f5d8d')
sha256sums_x86_64=('a5840017db142eaef133e2773a307a8af2e02dcded71c41b8386d8370e755f39')
sha256sums_aarch64=('5f0be1b42b6586f70ef8c64d7fb6962def7590f680f4d8643a7a3b364c12f4b6')

package() {
  install -Dm755 "sop" "${pkgdir}/usr/bin/sop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
