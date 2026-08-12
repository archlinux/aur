# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.15.0
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
sha256sums_x86_64=('652830db95e81868dbe38fbb3f506365511c99a1831b5e8955deac38f3f645f8')
sha256sums_aarch64=('41e452eb52ea735378b84d112aef47b27d7148ec02bdb4ac2de4eb7b6a8147cd')
sha256sums_i686=('dd7b22a3414cc70330301d508dae39b3aa264ff101ab40484f7ebc7714eb2fdc')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH/aarch/arm}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
