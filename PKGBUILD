# Maintainer: CUB3D <cub3d at cub3d dot pw>

pkgname=ghidra-extension-picoblaze-git
pkgver=0.1.0
pkgrel=1
pkgdesc='PicoBlaze for ghidra'
url='https://github.com/CUB3D/ghidra-picoblaze'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('ghidra')
makedepends=('gradle' 'ghidra')
source=("git+https://github.com/CUB3D/ghidra-picoblaze")
sha256sums=('SKIP')

build() {
    /opt/ghidra/support/sleigh -a ghidra-picoblaze/PicoBlaze/data/languages
    chmod o+r ghidra-picoblaze/PicoBlaze/data/languages/KCPSM3.sla
}

package() {
  mkdir -p "${pkgdir}/opt/ghidra/Ghidra/Processors"
  mv ghidra-picoblaze/PicoBlaze "${pkgdir}/opt/ghidra/Ghidra/Processors/"
}

# vim: ts=2 sw=2 et:
