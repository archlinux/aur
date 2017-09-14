# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu
pkgver=1.3.2
pkgrel=1
pkgdesc="A general screenshot and upload utility for images, video, and gifs."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("MIT")
conflicts=("${pkgname}-git")
depends=("maim" "ffmpeg" "curl" "jq" "bash" "xdotool")
optdepends=(
    "xsel: Copy URLs to clipboard after upload."
    "dmenu: Display a menu to select the output type from."
    "rofi: Display a menu to select the output type from."
    "libnotify: Display a notification when the utlity is finished."
)
source=("https://codeload.github.com/winneon/${pkgname}/tar.gz/${pkgver}")
sha256sums=("39707fc4ea72aa94aee0da39973591a11d947169db6949a3ffa38a99d9f58e6e")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
