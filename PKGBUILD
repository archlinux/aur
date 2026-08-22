# Maintainer: czyt <czytcn@gmail.com>

pkgname=tcut-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Script terminal sessions in TypeScript, render reproducible MP4/GIF/SVG/HTML with Bun"
arch=('x86_64' 'aarch64')
url="https://github.com/AmanVarshney01/tcut"
license=('MIT')
provides=('tcut')
conflicts=('tcut')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/AmanVarshney01/tcut/releases/download/v${pkgver}/tcut-${pkgver}-linux-arm64")
sha256sums_x86_64=('afeaa0da84750f1384fe78aa41fae37542373fa198f95c8da8c2651d5f8902dd')
sha256sums_aarch64=('f51f11bafc37f916ba153f4ca35132fdc96ab7d6747d08ab68a5711e98e6bcc1')

package() {
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
  esac
  install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/tcut"
}
