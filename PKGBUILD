# Maintainer: Your Name <youremail@domain.com>

_pkgname=espanso
pkgname=${_pkgname}-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("https://github.com/federico-terzi/espanso/releases/download/v${pkgver}/espanso-linux.tar.gz"
        "service")
sha512sums=('1df2e8fdc79cba4e84700cd64a43c6fce635e7b1608d99f6523843398cd0a77743e308ca50eefabd5b71079419e9a9261bc26c47ea049f930444bddd895ddf13'
            '5eb7b751e9432c7dde71da1f0c8c459b33a6a15d3a81aa21cbaa251b7b2cdddc47da9a0ab22215a9fb063ecdd8123c86c8f96459e627fd6daff4e690ff1a6df2')


package() {

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
