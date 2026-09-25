# Maintainer: czyt <czytcn@gmail.com>
pkgname=thinkrail-bin
pkgver=0.1.3
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
sha256sums_x86_64=('45ea4261c22ef43878d87be6ba18c05d8fc91b5a6bf3cc63bffd22d6141a8873')
sha256sums_aarch64=('5102397ae413db8cee69207d170db53a2465fa0e958a4f2b4e9c174a4174ea2e')

package() {
  local source_file
  case "${CARCH}" in
    x86_64) source_file="${pkgname}-${pkgver}-x86_64" ;;
    aarch64) source_file="${pkgname}-${pkgver}-aarch64" ;;
  esac

  install -Dm755 "${srcdir}/${source_file}" "${pkgdir}/usr/bin/thinkrail"
}
