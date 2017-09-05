# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu
pkgver=1.1.2
pkgrel=1
pkgdesc="A general screenshot and upload utility for images, video, and gifs."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("MIT")
conflicts=("${pkgname}-git")
depends=("maim" "ffmpeg" "curl" "jq" "bash")
optdepends=(
    "xclip: Copy URLs to clipboard after upload"
)
source=("https://codeload.github.com/winneon/${pkgname}/tar.gz/${pkgver}")
sha256sums=("dbd0e04b30c309f2744e988411dbf5ecb24463a1ca7b43477a2824299a8c2e92")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
