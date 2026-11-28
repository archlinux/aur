# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pssa-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Non-transformer language model written from scratch in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Sparticle62ops/pssa"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Sparticle62ops/pssa/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pssa-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pssa-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('7d149ad2c287bd7bdfaf604a139f880aa954b68a3b714e431cb96853a07441de')
sha256sums_aarch64=('fd73e0d47c787c5e845bfc559938d6274f53c3327170c033cecd3d6e52a8d2e1')

package() {
  install -Dm755 "pssa" "${pkgdir}/usr/bin/pssa"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
