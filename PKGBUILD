# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=imagemage-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Tiny CLI for OpenAI Images and Gemini image generation"
arch=('x86_64' 'aarch64')
url="https://github.com/quinnypig/imagemage"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/imagemage_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/imagemage_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('6ed4300f932099d3adebb3f30c2226666c0648838ddffbc88fcd3609745a985e')
sha256sums_aarch64=('f42086aad2fe80b36e98a1a570518db4a32af0c09c9dcdfb065a235d53acd6c3')

package() {
  install -Dm755 "imagemage" "${pkgdir}/usr/bin/imagemage"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
