# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goclone-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Clone websites for offline viewing"
arch=('x86_64' 'aarch64')
url="https://github.com/shurco/goClone"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shurco/goClone/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goClone_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goClone_${pkgver}_linux-arm64.tar.gz")
sha256sums=('069781c299f8a7c5d155b274c4dc2d47bee048334eaabd266ff33b31bc3ffe6d')
sha256sums_x86_64=('2677ed075cbe2bf9fa0ae666973f4c5f423a326e32fbd033a1b0f332bd40fab2')
sha256sums_aarch64=('b6d0902c4ce11f35ab1bde63132a9f937ca48e45943ad92ceed6aaed9f0bc606')

package() {
  install -Dm755 "goclone" "${pkgdir}/usr/bin/goclone"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
