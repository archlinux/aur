# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=title-tidy-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="Rename TV shows and movies for media centers"
arch=('x86_64' 'aarch64')
url="https://github.com/Digital-Shane/title-tidy"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Digital-Shane/title-tidy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/title-tidy-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/title-tidy-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('75a9171cf47d103d07c115d84b5d7bcfe57f6f65c40ea7402fe81ad2b49758dd')
sha256sums_aarch64=('98c797f652593e8ab22a6e4c744860d1c9ab50c0f62946d124e043c1da70a173')

package() {
  install -Dm755 "title-tidy" "${pkgdir}/usr/bin/title-tidy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
