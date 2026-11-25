# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=typeid-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Type-safe, K-sortable, globally unique identifier inspired by Stripe IDs"
arch=('x86_64' 'aarch64')
url="https://github.com/jetify-com/typeid"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jetify-com/typeid/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/typeid_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/typeid_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')
sha256sums_x86_64=('42c0f811d7bd9ddd643929b567082a41d39f0bab4d37553dc77f32bf9e4defa3')
sha256sums_aarch64=('10c6c8d9f5abf8c1e7b6ba181dc5de64a9156945a617bac30e7be33c22018bc3')

package() {
  install -Dm755 "typeid" "${pkgdir}/usr/bin/typeid"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
