# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.11.1
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
sha256sums_x86_64=('b4515da28f2fc44dace1d09a06240146e358d35bba247cf16fcb3fbfb00c7166')
sha256sums_aarch64=('66c98fbdb47b1590859a1d75a4c5bf961cef15261b8bb7f924c7568cde3a66fc')
sha256sums_i686=('cd5271490ccd3013dbf903b4dfafc3fed58434022b4e7b2d45ef993280713850')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH/aarch/arm}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
