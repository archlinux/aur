# Maintainer: czyt <czytcn@gmail.com>

pkgname=tcut-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Script terminal sessions in TypeScript, render reproducible MP4/GIF/SVG/HTML with Bun"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanVarshney01/tcut"
license=('MIT')
provides=('tcut')
conflicts=('tcut')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-arm64")
sha256sums_x86_64=('b29fd7747a5b47ca2cc5be51377830bb0a1e30191907d429dba6a977f0654c34')
sha256sums_aarch64=('65b800720b11081c3801366a5548502770c5a10c7b65bc4a50c480709501d369')

package() {
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
  esac
  install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/tcut"
}
