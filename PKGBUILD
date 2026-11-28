# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=novel-studio-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="AI novel generator for long-form fiction with RAG"
arch=('x86_64' 'aarch64')
url="https://github.com/Xiaoyangy/novel-studio"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/novel-studio_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/novel-studio_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f4a9ccfd937815406c58678da223f2eba646d0f8fdfdcd63094d531524e0157c')
sha256sums_aarch64=('f682400e85ae87d918d0f14173fc74c489c42bf61c9e9b63c944d4ca75374476')

package() {
  install -Dm755 "novel-studio" "${pkgdir}/usr/bin/novel-studio"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
