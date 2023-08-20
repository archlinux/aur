# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.5.0
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
sha256sums_x86_64=('af816ea9da14974aed2c8e641001e1aeaa016cd84c77ce99aaf05eded6409343')
sha256sums_aarch64=('8fc8788eb5dd2c5ee7856e2c1e4b770aeee1155a720794596e19aafeed5e5c77')
sha256sums_i686=('724c4299ea3c18e79f5a8eb6f7faf6a7a24188d7236779f606380ac781c607eb')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
