# Maintainer: czyt <czytcn@gmail.com>

pkgname=tcut-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Script terminal sessions in TypeScript, render reproducible MP4/GIF/SVG/HTML with Bun"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanVarshney01/tcut"
license=('MIT')
provides=('tcut')
conflicts=('tcut')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-arm64")
sha256sums_x86_64=('e6b8f238acd7cb9c75f7dc74b1eb7ce618a789f65d3d89263fd3216b75ab41aa')
sha256sums_aarch64=('c5555d27bdb36d2f65a9f0d92e4d9e2555ae17bf17060178f14c0113ce7f4fd5')

package() {
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
  esac
  install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/tcut"
}
