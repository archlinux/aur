# Maintainer: czyt <czytcn@gmail.com>

pkgname=tcut-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Script terminal sessions in TypeScript, render reproducible MP4/GIF/SVG/HTML with Bun"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanVarshney01/tcut"
license=('MIT')
provides=('tcut')
conflicts=('tcut')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-arm64")
sha256sums_x86_64=('34aeea1b071840fbfd3de52b926be7192749c6381ffa00dbaa5496e8bc5726b4')
sha256sums_aarch64=('82976af78f83745a5afe1608ea8d932b5e266ffc61819b16645605140fda5c10')

package() {
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
  esac
  install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/tcut"
}
