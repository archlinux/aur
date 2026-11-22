# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wordl-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal-based Wordle game"
arch=('x86_64')
url="https://github.com/palerdot/wordl-rs"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/palerdot/wordl-rs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wordl-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('f09b5249ef53cb026616c45760bff59c6b42a33fc46c5b4b050f3d50a183f9df')

package() {
  install -Dm755 "wordl" "${pkgdir}/usr/bin/wordl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
