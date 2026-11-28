# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bird-lg-go-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="BIRD looking glass"
arch=('x86_64' 'aarch64')
url="https://github.com/xddxdd/bird-lg-go"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xddxdd/bird-lg-go/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bird-lg-go-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bird-lg-go-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('cba1622c9466c4a59c0a2ac2b8363aa74f6375c55dc78ac1a316989d88fc6356')
sha256sums_aarch64=('1d6dc7f7bc6e6f48066a59277a56ad4d48d0f5bcae84bdfcdc4fc19500addd5a')

package() {
  install -Dm755 "bird-lg-go" "${pkgdir}/usr/bin/bird-lg-go"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
