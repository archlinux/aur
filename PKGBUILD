# Maintainer: czyt <czytcn@gmail.com>
pkgname=thinkrail-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Vibe code with pi in a lightweight, real IDE - The Vibe You Need'
arch=('x86_64' 'aarch64')
url='https://thinkrail.ai'
license=('Apache-2.0')
depends=(
  'glibc'
  'git'
  'xdg-utils'
)
options=('!debug' '!strip')
provides=('thinkrail')
conflicts=('thinkrail')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/JetBrains/thinkrail/releases/download/v${pkgver}/thinkrail-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/JetBrains/thinkrail/releases/download/v${pkgver}/thinkrail-linux-arm64")
sha256sums_x86_64=('2620f5471fae63120038013a3dcefb718f96cf2a926592542eebe74ff778549d')
sha256sums_aarch64=('892761d7898834c9f58140b04bdafcc4f89202fc761cee615d75cd961622157f')

package() {
  local source_file
  case "${CARCH}" in
    x86_64) source_file="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) source_file="${pkgname}-${pkgver}-aarch64" ;;
  esac

  install -Dm755 "${srcdir}/${source_file}" "${pkgdir}/usr/bin/thinkrail"
}
