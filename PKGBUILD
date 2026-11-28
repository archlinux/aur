# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rp6502-bin
pkgver=0.44
pkgrel=1
pkgdesc="Emulator for the RP6502 Picocomputer"
arch=('x86_64' 'aarch64')
url="https://github.com/picocomputer/rp6502"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libglvnd' 'libpulse' 'libstdc++' 'libx11' 'libxcursor' 'libxi')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/picocomputer/rp6502/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rp6502-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rp6502-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('b81e26bbde4758d5c7d2c15bb25028fcc7d04504c4769da267f10d6ba1b1989b')
sha256sums_x86_64=('ac1ec9c5653721e630e00238b311fe791c05a5bc8ee6ca3d904b951de45e3680')
sha256sums_aarch64=('c25883a5137ea1bc9611cddb6b4cd3b2a94ded49f013de23c7fc1dc35a664643')

package() {
  install -Dm755 "rp6502-emu" "${pkgdir}/usr/bin/rp6502-emu"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
