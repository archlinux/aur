# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=snarkos-bin
pkgver=4.13.1
pkgrel=1
pkgdesc="A Decentralized Operating System for ZK Applications"
arch=('x86_64')
url="https://github.com/aleo-labs-protocol/snarkOS"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aleo-labs-protocol/snarkOS/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/aleo-v${pkgver}-x86_64-unknown-linux-gnu.zip")
sha256sums=('d1ee81266b96305cdec883e60fad804aa1d04b4698dccb5942ca51816b10df57')
sha256sums_x86_64=('23a93edcaee8fee88077028798648accf7cfe54e06dd64b0ed0174b39fd379f1')

package() {
  install -Dm755 "snarkos" "${pkgdir}/usr/bin/snarkos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
