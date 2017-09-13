# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu
pkgver=1.3.0
pkgrel=1
pkgdesc="A general screenshot and upload utility for images, video, and gifs."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("MIT")
conflicts=("${pkgname}-git")
depends=("maim" "ffmpeg" "curl" "jq" "bash")
optdepends=(
    "xclip: Copy URLs to clipboard after upload."
    "dmenu: Display a menu to select the output type from."
    "rofi: Display a menu to select the output type from."
    "libnotify: Display a notification when the utlity is finished."
)
source=("https://codeload.github.com/winneon/${pkgname}/tar.gz/${pkgver}")
sha256sums=("862cfc7510871be28fd69fffe8c52ee8be757288b1021c216417a2169a0bf9b5")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
