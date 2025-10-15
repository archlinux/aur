# Maintainer: devome <evinedeng@hotmail.com>

_tarname="Restic-Browser"
_pkgname="${_tarname,,}"
pkgname="${_pkgname}-bin"
pkgver=0.3.3
pkgrel=2
pkgdesc="A GUI to browse and restore restic backup repositories."
arch=("x86_64")
url="https://github.com/emuell/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("MIT")
depends=("restic" "webkit2gtk-4.1")
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_tarname}-v${pkgver}-linux.zip"
        "${_pkgname}.png::${url}/raw/refs/tags/v${pkgver}/src-tauri/icons/icon.png"
        "${_pkgname}.desktop"
        "${_pkgname}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('7db8b5356c003cd97cfabeb6acf81c4d31be19caad5295976551661d1835a2b3'
            '3a9f06e4bc146fb3231d58b726dfdc0965809996411523b8edcb37289980b744'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71'
            '126dd1280b1326514b22d0ef4d2020bdea66fd6d64f455c73ae29ac94a04e2da')

prepare() {
    tar -xf "${_tarname}.tar"
}

package() {
    install -Dm755 "${_tarname}"         "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
