# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=1.7
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d799297e4bded4fe00cddfebea79ccef6d251aa74a3794b9470b431084d2e25')

build() {
  cd "${pkgname}-${pkgver}"

  make prod
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 rasm.exe "${pkgdir}"/usr/bin/rasm.exe

  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
  install -m644 document*.pdf ReadMe "${pkgdir}"/usr/share/doc/"${pkgname}"/ 

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/{ZX0-main,libdivsufsort}
  install -m644 ZX0-main/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/ZX0-main/
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
