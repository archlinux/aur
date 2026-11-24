# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=1history-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Merge your shell histories into one file"
arch=('x86_64' 'aarch64')
url="https://github.com/localfirstapp/1history"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/localfirstapp/1history/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/onehistory-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/onehistory-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('38e0916d47b5d3da210e9eb1e15f682219478479dd532e484dc8e5d79b6dcfc8')
sha256sums_aarch64=('acacd054534efdffd31e7c62aa66c00132f69073d59c46031dde914e7bfd6450')

package() {
  install -Dm755 "onehistory" "${pkgdir}/usr/bin/onehistory"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
