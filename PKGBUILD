# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seonbi-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="SmartyPants-like typographic processor for Korean text"
arch=('x86_64' 'aarch64')
url="https://github.com/dahlia/seonbi"
license=('LGPL-2.1-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::${_dl}/seonbi-${pkgver}.linux-x86_64.tar.bz2")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.bz2::${_dl}/seonbi-${pkgver}.linux-arm64.tar.bz2")
sha256sums_x86_64=('bf4e92507bd0e08d963c838c269070633f0bcd04347a50008c4256c0aa9e5b1b')
sha256sums_aarch64=('aa18b3845d9a8cd79e29c0b06578507481617f1a570cae626ddb5cf6f4fd9149')

package() {
  install -Dm755 "seonbi" "${pkgdir}/usr/bin/seonbi"
  install -Dm755 "seonbi-api" "${pkgdir}/usr/bin/seonbi-api"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
