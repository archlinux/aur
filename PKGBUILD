# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="A PDF processor written in Go."
arch=(x86_64 aarch64 i686)
url="https://pdfcpu.io/"
license=('Apache')
provides=(pdfcpu)
conflicts=(pdfcpu pdfcpu-git)

source_x86_64=("pdfcpu-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_x86_64.tar.xz")
source_aarch64=("pdfcpu-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_arm64.tar.xz")
source_i686=("pdfcpu-i686-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_i386.tar.xz")
sha256sums_x86_64=('8c42a920469e1638eff7f61fb763ddf2b8082991004db6dd591c23407792ac05')
sha256sums_aarch64=('60f5790c1a9c33ce6f036ad456cc121ad84c8f212dc37d784e55faf541321896')
sha256sums_i686=('3c9ae50fce44e6f5f4ba3d6e611ec15b7fcea7466c820d25f89a88db2ab7c1eb')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
