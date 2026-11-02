# Maintainer: czyt <czytcn@gmail.com>
pkgname=thinkrail-bin
pkgver=0.3.1
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
sha256sums_x86_64=('f9e8a24f47d4c4667d5f0b7af60a62c68b1f19b4a2e7c249d3c22c145fbf6deb')
sha256sums_aarch64=('e166dbc0f6b74edac2f40c2ef59278da770f1b302b3d022ff9f9b036c882a9b3')

package() {
  local source_file
  case "${CARCH}" in
    x86_64) source_file="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) source_file="${pkgname}-${pkgver}-aarch64" ;;
  esac

  install -Dm755 "${srcdir}/${source_file}" "${pkgdir}/usr/bin/thinkrail"
}
