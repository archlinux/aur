# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="restic-browser"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="A GUI to browse and restore restic backup repositories."
arch=("x86_64")
url="https://github.com/emuell/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("MIT")
depends=("restic" "webkit2gtk")
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Restic-Browser-v${pkgver}-linux.zip"
        "${_pkgname}.png::https://raw.githubusercontent.com/emuell/${_pkgname}/master/src-tauri/icons/icon.png"
        "${_pkgname}.desktop"
        "https://raw.githubusercontent.com/emuell/${_pkgname}/master/LICENSE")
sha256sums=('803948340de889428d5ec160c1fcc042690984929bead70be022e79f71c3373b'
            '3a9f06e4bc146fb3231d58b726dfdc0965809996411523b8edcb37289980b744'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71'
            'cd66a6138587ba65a3be1629ed36820c9c20ad1f630f5b311fcff219610b5f7e')

prepare() {
    tar -xf "${_pkgname}.tar"
}

package() {
    install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
