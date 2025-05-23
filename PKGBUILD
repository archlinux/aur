# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.10.2
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
sha256sums_x86_64=('81ed311932db8b88524c9f0b0ef4a166bef9ee3c94749cdf48b86d072481cf07')
sha256sums_aarch64=('e67aa11378f543fd1179252895629988a87d94c383f04d41aab4155893df975a')
sha256sums_i686=('1e5b37c0604f587ec9601154860714000913f985ec50a1ad21c237623ec43613')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH/aarch/arm}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
