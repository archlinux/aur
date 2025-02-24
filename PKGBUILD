# Maintainer: CUB3D <cub3d at cub3d dot pw>

pkgname=ghidra-extension-pdk-git
pkgver=0.1.0
pkgrel=1
pkgdesc='PADAUK architectures for ghidra'
url='https://github.com/CUB3D/ghidra-pdk'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('ghidra')
makedepends=('gradle' 'ghidra')
source=("git+https://github.com/CUB3D/ghidra-pdk")
sha256sums=('SKIP')

build() {
    /opt/ghidra/support/sleigh -a ghidra-pdk/PDK/data/languages
    chmod o+r ghidra-pdk/PDK/data/languages/*.sla
}

package() {
  mkdir -p "${pkgdir}/opt/ghidra/Ghidra/Processors"
  mv ghidra-pdk/PDK "${pkgdir}/opt/ghidra/Ghidra/Processors/"
}

# vim: ts=2 sw=2 et:
