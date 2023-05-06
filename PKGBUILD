# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A PDF processor written in Go."
arch=(x86_64 aarch64 i686)
url="http://pdfcpu.io/"
license=('Apache')
provides=(pdfcpu)
conflicts=(pdfcpu pdfcpu-git)

source_x86_64=("pdfcpu-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_x86_64.tar.xz")
source_aarch64=("pdfcpu-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_arm64.tar.xz")
source_i686=("pdfcpu-i686-${pkgver}-${pkgrel}.tar.xz::https://github.com/pdfcpu/pdfcpu/releases/download/v${pkgver}/pdfcpu_${pkgver}_Linux_i386.tar.xz")
sha256sums_x86_64=('491ac42e06a6031735aaaf4d6cec1aae7025d4a63bef124524002c8aef41e8c1')
sha256sums_aarch64=('9c942d23c256d8b14d4f803282b1062887c3cc630ac9ee32826820485069f075')
sha256sums_i686=('536867d6d3fcaf8d27783098236fa73deacd621fb0d161738cb3aec59f212bf8')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
