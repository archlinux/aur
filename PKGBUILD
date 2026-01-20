# Maintainer: DenXV <aur@denxv.me>

_pkgname="hylauncher"
pkgname="hylauncher-bin"
pkgver="0.6.5"
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
    "gstreamer"
    "gtk3"
    "hicolor-icon-theme"
    "webkit2gtk"
)

source=(
    "${_pkgname}::${url}/releases/download/v${pkgver}/HyLauncher-linux-x64"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "bf4714e1795c34021e60219f243d929d6c6debaba7fdf0c5456d83eb547efbd8"
    "d9f52aab09686940a5db773149cdf547f57ddbae63b8efa82522fb02e49287a6"
    "065e5283a7e30fd654e6d18706dd1ae586f193e4698f310614a0593f62285a3f"
    "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
)

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
