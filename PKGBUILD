# Maintainer: Your Name <youremail@domain.com>

_pkgname=espanso
pkgname=${_pkgname}-bin
pkgver=0.2.4
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
sha512sums=('070f24812ca8b6eab63725845c5b2680a52d2f8946f108d381fe841ad50c227cf891a1a18a8da150f4392df94a7eebf43fa5deeec7683e010ba6c6bc020ad0bf'
            '5eb7b751e9432c7dde71da1f0c8c459b33a6a15d3a81aa21cbaa251b7b2cdddc47da9a0ab22215a9fb063ecdd8123c86c8f96459e627fd6daff4e690ff1a6df2')


package() {

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
