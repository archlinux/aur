# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="1.0.24"
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
    "gst-plugins-good"
    "gtk3"
    "webkit2gtk-4.1"
)

source=(
    "${url}/releases/download/v${pkgver}/HyPrism-linux-x86_64.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "LICENSE"
)
sha256sums=(
    "7a549d52649d6295bc0313244dd1458ee53e86e260c657fe2559e3ea2dcd25c0"
    "aa02f966741bb9f4979778fded2f35c025147fa99f66d88108b1ef7b54e0c5eb"
    "952bf82076bde0e517c450853f8818d4831ba919e2421a33e3401415c98e5dd3"
    "acd0c57892db5a0f25a44bd29a10bedc61c2a12508af24e1a8037a1df7aeb710"
)

package() {
    install -Dm755 "HyPrism" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
