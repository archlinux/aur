# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=metro2-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Create and validate Metro 2 credit reporting files"
arch=('x86_64')
url="https://github.com/moov-io/metro2"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/moov-io/metro2/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/metro2-linux-amd64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('98bd4587e4149c9b2d9a7505fdd7a0180ca412ab5db97c955278f99a24f3c74a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/metro2"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
