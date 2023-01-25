# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=1.8
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3de6a1df1ff113cdcaa78ad5621cd66d7be55e07872ab6dbcf72cf3c4606863')

build() {
  cd "${pkgname}-${pkgver}"

  make prod
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 rasm.exe "${pkgdir}"/usr/bin/rasm.exe

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/{ZX0-main,libdivsufsort}
  install -m644 ZX0-main/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/ZX0-main/
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
