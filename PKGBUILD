# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mycart-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="Single-file shopping cart with card and cryptocurrency payments"
arch=('x86_64' 'aarch64')
url="https://github.com/shurco/mycart"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shurco/mycart/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mycart_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mycart_${pkgver}_linux-arm64.tar.gz")
sha256sums=('069781c299f8a7c5d155b274c4dc2d47bee048334eaabd266ff33b31bc3ffe6d')
sha256sums_x86_64=('baa060d50ddae7db283caecf560e2db45baa76f1eef1874b816884c3681c6c57')
sha256sums_aarch64=('5eed80ea9b6c8f47f3c43f1ea15deefeb098cf1c9645911260458d0e4ee8c291')

package() {
  install -Dm755 "mycart" "${pkgdir}/usr/bin/mycart"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
