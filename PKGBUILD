# Maintainer: CUB3D <cub3d at cub3d dot pw>

pkgname=ghidra-extension-hexagon-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Hexagon QDSP6 for ghidra'
url='https://github.com/CUB3D/ghidra-hexagon-sleigh'
arch=('x86_64')
license=('Apache-2.0')
depends=('ghidra')
makedepends=('gradle')
source=("git+https://github.com/CUB3D/ghidra-hexagon-sleigh")
sha256sums=('SKIP')

build() {
    /opt/ghidra/support/sleigh -a ghidra-hexagon-sleigh/Hexagon/data/languages
    chmod o+r ghidra-hexagon-sleigh/Hexagon/data/languages/skel.sla
}

package() {
  mkdir -p "${pkgdir}/opt/ghidra/Ghidra/Processors"
  mv ghidra-hexagon-sleigh/Hexagon "${pkgdir}/opt/ghidra/Ghidra/Processors/"
}

# vim: ts=2 sw=2 et:
