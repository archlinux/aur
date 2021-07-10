# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=colorpicker-keshavbhatt
pkgver=1.0.2
pkgrel=1
pkgdesc="Powerful screen ColorPicker/Chooser application for Linux Desktop"
arch=("x86_64")
url="https://github.com/keshavbhatt/ColorPicker"
license=("MIT")
depends=("qt5-base")
conflicts=("colorpicker" "color-picker")
source=(
    "https://github.com/keshavbhatt/ColorPicker/archive/refs/tags/1.0.2.tar.gz"
)
sha512sums=(
    "82ef4af0a0eee1dcf45499154115bff6b0c654f7c9b268e5955e29748b1dd51d864bb193364d36874c11387eb6294e189ded157ab384aadb6ba09e1007b0685c"
)

build() {
    cd "ColorPicker-${pkgver}"

    mkdir build
    cd build

    qmake ../src
    make
}

package() {
    cd "ColorPicker-${pkgver}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/colorpicker-keshavbhatt/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/colorpicker-keshavbhatt/README.md"

    cd build
    make INSTALL_ROOT="${pkgdir}" install
}
