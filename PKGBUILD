# Maintainer: DenXV <aur@denxv.me>

_pkgname="hylauncher"
pkgname="hylauncher-bin"
pkgver="1.0.5"
pkgrel="1"
pkgdesc="HyLauncher - unofficial Hytale Launcher for free to play gamers (binary version)"
arch=("x86_64")
url="https://github.com/ArchDevs/HyLauncher"
license=("GPL-3.0-only")

provides=("hylauncher")
conflicts=(
    "hylauncher"
    "hylauncher-git"
)
depends=(
    "gtk3"
    "webkit2gtk-4.1"
)

source=(
    "${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/HyLauncher-linux-x64"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "48c0f2c252740e34d2d1a0a62bd6829a4f2c9f41f6e6898aca53557214e82298"
    "abf2b362796ae2b2f40ae5d3dec5ea8b74bf131faafe20304d76df5a604551d4"
    "065e5283a7e30fd654e6d18706dd1ae586f193e4698f310614a0593f62285a3f"
    "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
)

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
