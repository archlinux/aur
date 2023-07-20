# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

_pkgname=pdfcpu
pkgname=pdfcpu-bin
pkgver=0.4.2
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
sha256sums_x86_64=('1624492af22c01da5b845ae3ceb17d0fad6089c0db0f93cf8e2492ce231c86aa')
sha256sums_aarch64=('bc2aa141028925a81c706c70ba12df2d9c0b4883a0741baad6d332f04e9e3064')
sha256sums_i686=('a2c9127836cce51c18e9c7ca52ce62094579f7a3d07075adfb936fbc3481c56b')

package() {
    cd "${_pkgname}_${pkgver}_Linux_${CARCH}"

    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
