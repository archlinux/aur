# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="restic-browser"
pkgname="${_pkgname}-bin"
pkgver=0.3.1
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
sha256sums=('230f590bb9837c84e6757a03236a50727e3636b593f8368c8d713561987f8450'
            '3a9f06e4bc146fb3231d58b726dfdc0965809996411523b8edcb37289980b744'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71'
            '126dd1280b1326514b22d0ef4d2020bdea66fd6d64f455c73ae29ac94a04e2da')

prepare() {
    tar -xf "${_pkgname}.tar"
}

package() {
    install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
