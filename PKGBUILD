# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A PDF processor written in Go."
arch=(x86_64 aarch64 i686)
url="https://pdfcpu.io/"
license=('Apache-2.0')
provides=(pdfcpu)
conflicts=(pdfcpu)

source_x86_64=("pdfcpu-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_x86_64.tar.xz")
source_aarch64=("pdfcpu-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_arm64.tar.xz")
source_i686=("pdfcpu-i686-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_i386.tar.xz")
sha256sums_x86_64=('f55d112c28bb0e9d2d3f87b847bb12aa7243e86aae1d21bda47b31c87fcba241')
sha256sums_aarch64=('8c8ad5abb8b10b72600ae46d2f8e325140b21a5ffe133f649defb133726e4e4e')
sha256sums_i686=('2aecfc48b67db47cacd2a18f2786c7182db745b4ab414d776de2fa181cb350eb')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH/aarch/arm}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
