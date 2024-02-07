# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname="restic-browser"
pkgname="${_pkgname}-bin"
pkgver=0.3.0
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
        "${_pkgname}.desktop")
sha256sums=('965a7efe99d3264dae2fd2d7f6e123a57b185f9be74227df7e2469da25c0ef0b'
            '3a9f06e4bc146fb3231d58b726dfdc0965809996411523b8edcb37289980b744'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71')

prepare() {
    tar -xf "${_pkgname}.tar"
}

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
