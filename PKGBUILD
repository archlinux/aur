# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=ipeek-bin
_pkgname=ipeek
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal image viewer (Kitty/Sixel/iTerm2/half-blocks) — prebuilt binary"
arch=('x86_64')
url="https://github.com/prietus/peek"
license=('MIT')
depends=('gcc-libs')
optdepends=('ffmpeg: video previews; AVIF/HEIC/JPEG XL decoding'
            'imagemagick: AVIF/HEIC/JPEG XL decoding (preferred over ffmpeg)'
            'wl-clipboard: copy image/path to the clipboard on Wayland'
            'xclip: copy image/path to the clipboard on X11')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
