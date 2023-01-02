# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=colorpicker-keshavbhatt
pkgver=1.0.3
pkgrel=1
pkgdesc="Powerful screen ColorPicker/Chooser application for Linux Desktop"
arch=("x86_64")
url="https://github.com/keshavbhatt/ColorPicker"
license=("MIT")
depends=("qt5-base")
conflicts=("colorpicker" "color-picker")
source=(
    "https://github.com/keshavbhatt/ColorPicker/archive/refs/tags/1.0.3.tar.gz"
)
sha512sums=(
    "3bd200aba8dca9f53d6b2a65befec399d937e790c472b03f7dd57e4a366a1abf0f27f0792765f87052864cc0f5d416908de44a098e360b45dd8c2d651084fbbf"
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
