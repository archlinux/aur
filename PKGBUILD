# Maintainer: Pavel Dobiáš <git at paveldobias dot eu>

pkgname=imageglass-bin
pkgver=10.0.6.906
pkgrel=1
pkgdesc="A Fast, Seamless Photo Viewer"
arch=(x86_64)
url="https://imageglass.org"
license=("GPL-3.0-only")
depends=(
    "fontconfig"
    "glibc"
    "hicolor-icon-theme"
    "libgomp"
)
provides=("imageglass")
conflicts=("imageglass")
options=(!debug)
source=(
    "https://github.com/d2phap/ImageGlass/releases/download/${pkgver}/ImageGlass_${pkgver}_linux-x64.tar.gz"
    "imageglass.desktop"
)
sha256sums=(
    "d9a2871ea94cf2c5e5a8bc347759aabfa0dc4fede087eef242dad5cc30de2d42"
    "c470aeb84bcd7b41b9c33404febaa7401903555b7d77d3edebf68084771f3926"
)

package() {
    install -d "${pkgdir}/opt/imageglass"
    cp -a ImageGlass/. "${pkgdir}/opt/imageglass/"

    install -Dm644 ImageGlass/_themes/Kobe/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/imageglass.svg"
    install -Dm644 imageglass.desktop "${pkgdir}/usr/share/applications/imageglass.desktop"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/imageglass/ImageGlass" "${pkgdir}/usr/bin/imageglass"

}
