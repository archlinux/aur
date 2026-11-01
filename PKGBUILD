# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname="network-monitor"
_pkgauthor="grigio"
pkgname="${_pkgname}-bin"
pkgver=0.7.6
pkgrel=1
pkgdesc="A real-time network connection monitoring tool built with Rust and GTK4, displaying active connections with live I/O statistics in a modern graphical interface"
url="https://github.com/${_pkgauthor}/${_pkgname}"
arch=("x86_64")
license=("GPL-3.0")
depends=("pango" "gtk4" "libadwaita")
provides=("${_pkgname}" "nmt")
install="${_pkgname}.install"
source=("LAUNCHER-${pkgver}.desktop::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/${_pkgname}.desktop"
        "ICON-${pkgver}.svg::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/icons/${_pkgname}.svg"
        "README-${pkgver}.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/README.md"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v$pkgver/${_pkgname}-x64.tar.gz")
b2sums=('fc4dc7ccbfb5d44c1b6630f3dd0c03aee9b57982ac574d4553171cdad0690a0f9defdc01e71f7ce17492c4661e024d9f84e45b838e632fd48a38a9ed04100336'
        '28b0f158bbc8923b112c8437f0d0be5aadcc69e6ff0d9fd8e02ebb51118bc27c6bf7a2d6883f01aa1f23fb052dfd3c513f9809e5e605b00677946d1b13cb3fb5'
        '35aa06a1c503317525f1fae60c1e07e5997f2c3ad8c191342f03a21b49efa8a9ed432f3acad41664c7231c4da27f332412a8a2a4ef784e7bc026442b188c44ee'
        '67c8e3658e200572eff17163b6e4fa7115cf7b90c1944819a4cf2a68016914802aab5819c48bdad8e2ff8dfc29091fb6558faa032a5cca7221115b63b81a09a4')
b2sums_x86_64=('202bb42b30f9bf4001a94e99f569e3890d697bdbb1e9c62073fe93c012d85660a7f31d2f537851ba5b46c87ee4ff1375af359aef7064e463ca49981f766e50ca')
options=("!strip")

package() {
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm755 "nmt" -t "${pkgdir}/usr/bin/"

    install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "ICON-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
