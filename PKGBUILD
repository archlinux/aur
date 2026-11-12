# Maintainer: czyt <czytcn@gmail.com>
pkgname=thinkrail-bin
pkgver=0.4.0
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
sha256sums_x86_64=('d4718bde64352134ea1b522a7e3169325da62273105d6df1ba5aaa6fd245a4f8')
sha256sums_aarch64=('f99e15a10ebe7894967a4a2320c431e88dd5b991a34d468f3b017cf365e84283')

package() {
  local source_file
  case "${CARCH}" in
    x86_64) source_file="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) source_file="${pkgname}-${pkgver}-aarch64" ;;
  esac

  install -Dm755 "${srcdir}/${source_file}" "${pkgdir}/usr/bin/thinkrail"
}
