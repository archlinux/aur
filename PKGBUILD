# Maintainer: czyt <czytcn@gmail.com>

pkgname=tcut-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="Script terminal sessions in TypeScript, render reproducible MP4/GIF/SVG/HTML with Bun"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanVarshney01/tcut"
license=('MIT')
provides=('tcut')
conflicts=('tcut')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-arm64")
sha256sums_x86_64=('a09c7a845e3a5cd10058f82e125810923def765f47e481d0d457566fac9f4aaf')
sha256sums_aarch64=('b1d5dd25db5f467896a819c0e159d327f8ec1c5067b57142542f91b17b29468c')

package() {
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
  esac
  install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/tcut"
}
