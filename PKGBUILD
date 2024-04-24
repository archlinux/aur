# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A PDF processor written in Go."
arch=(x86_64 aarch64 i686)
url="https://pdfcpu.io/"
license=('Apache')
provides=(pdfcpu)
conflicts=(pdfcpu)

source_x86_64=("pdfcpu-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_x86_64.tar.xz")
source_aarch64=("pdfcpu-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_arm64.tar.xz")
source_i686=("pdfcpu-i686-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_i386.tar.xz")
sha256sums_x86_64=('6b9bd65b17e6b380d55b06b0095e8f0795340034fb919bfaf2ddf891853025ab')
sha256sums_aarch64=('6db2e1138c1292bc6fc834112871e00b1e41ac9e710f598964a135eb2ce56479')
sha256sums_i686=('384579fa19df75aac17aacaa76266664a08e4c0bef3de1d9440528efadcf4e8e')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH/aarch/arm}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
