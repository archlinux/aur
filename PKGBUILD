# Maintainer: CUB3D <cub3d at cub3d dot pw>

pkgname=ghidra-git-bin
pkgver=11.2.1
pkgrel=1
pkgdesc='Software reverse engineering framework'
url='https://ghidra-sre.org/'
arch=('x86_64')
license=('Apache-2.0')
depends=('java-environment>=21')
makedepends=('unzip' 'java-environment=21')
provides=('ghidra')
conflicts=(
  'ghidra'
  'ghidra-dev'
  'ghidra-desktop'
)
_builddate='20241105'
source=(
     https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${pkgver}_build/ghidra_${pkgver}_PUBLIC_${_builddate}.zip
)
sha256sums=('ce4db5117da0fbaf8f33863fec4f40902f754f06b68945a59fb1c0f9b1bc461c')

package() {
  # Extract built archive into destination folder
  mkdir -p "${pkgdir}/opt/ghidra/"
  mv ghidra_${pkgver}_PUBLIC "${pkgdir}/opt"
  mv "${pkgdir}/opt/ghidra_${pkgver}_PUBLIC/"* "${pkgdir}/opt/ghidra/"
  rm -r "${pkgdir}/opt/ghidra_${pkgver}_PUBLIC" 

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/ghidra/ghidraRun "${pkgdir}"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "${pkgdir}"/usr/bin/ghidra-analyzeHeadless
}

# vim: ts=2 sw=2 et:
