# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="1.0.23"
pkgrel="1"
pkgdesc="A multiplatform Hytale launcher with mod manager (binary version)"
arch=("x86_64")
url="https://github.com/yyyumeniku/HyPrism"
license=("MIT")

provides=("hyprism")
conflicts=(
    "hyprism"
    "hyprism-git"
)
depends=(
    "gst-plugins-base"
    "gst-plugins-good"
    "gstreamer"
    "gtk3"
    "hicolor-icon-theme"
    "libsoup3"
    "webkit2gtk-4.1"
)

source=(
    "https://github.com/yyyumeniku/HyPrism/releases/download/v${pkgver}/HyPrism-linux-x86_64.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "168af17cf102b116b0604dccd986236ab81ba932011b84eb046dd579452040e6"
    "7acb5e6fb996bcc2f2b5fa5fd90d5d7b0bc2c64824220a56b4a3d834f069da6d"
    "952bf82076bde0e517c450853f8818d4831ba919e2421a33e3401415c98e5dd3"
    "acd0c57892db5a0f25a44bd29a10bedc61c2a12508af24e1a8037a1df7aeb710"
)

package() {
    install -Dm755 "HyPrism" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
