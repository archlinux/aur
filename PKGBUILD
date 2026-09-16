# Maintainer: czyt <czytcn@gmail.com>
pkgname=thinkrail-bin
pkgver=0.1.1
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
sha256sums_x86_64=('56a0abf18424367154f726a1b691f9ca45166f32804f9f61dc3f0930747ca58d')
sha256sums_aarch64=('78ff9f0ec5945a18237a7ceb4abe2dfec33722010522a2abcdf46d1ca1c5eb3b')

package() {
  local source_file
  case "${CARCH}" in
    x86_64) source_file="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) source_file="${pkgname}-${pkgver}-aarch64" ;;
  esac

  install -Dm755 "${srcdir}/${source_file}" "${pkgdir}/usr/bin/thinkrail"
}
