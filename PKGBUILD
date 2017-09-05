# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu
pkgver=1.1.1
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
sha256sums=("e42c4a5523fd571366c9aeff39b4b2b5075dc3a529189e136ec0281202874260")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
