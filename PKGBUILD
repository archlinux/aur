# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu
pkgver=1.1.0
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
sha256sums=("239e97cd4bf1db5ce64b9fdfb1dc1c77609ea36d26f742e2f52efe3b8ead60c8")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
