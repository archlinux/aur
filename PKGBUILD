# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

pkgname=untrunc-anthwlock-gui-bin
_pkgname=untrunc-gui
pkgver=1.0.2
pkgrel=1
pkgdesc="Restore a damaged (truncated) mp4, m4v, mov, 3gp video. Pre-built GUI binary (GTK3) with bundled FFmpeg."
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/fr0stb1rd/untrunc"
license=('GPL-2.0-only')
depends=('gtk3')
provides=("${_pkgname}")
conflicts=('untrunc-gui' 'untrunc-gui-git')
options=('!strip')

_releaseurl="https://github.com/fr0stb1rd/untrunc/releases/download/v${pkgver}"

source=("${_pkgname}.desktop"
        "${_pkgname}.png::https://raw.githubusercontent.com/fr0stb1rd/untrunc/master/assets/untrunc-logo.png")
source_x86_64=("${_releaseurl}/untrunc-gui-linux-amd64")
source_aarch64=("${_releaseurl}/untrunc-gui-linux-arm64")
source_armv7h=("${_releaseurl}/untrunc-gui-linux-armv7")
source_i686=("${_releaseurl}/untrunc-gui-linux-i386")

sha256sums=('87566daad6468b7946d4f28da00832db8765c822c569f62d95bbe6870cf7df80'
            'c5278889de6fc68da7a4622ddbc8bf3e4ea1156c038e09cefd3f3f4b9f64c9b7')
sha256sums_x86_64=('013aa473f4cdb30fb18281f2848956fd01800c77c9e23da1eb926c962fb97e7c')
sha256sums_aarch64=('bc76bca11cfc4c17456bf6cfa9ddc00c8dd0ec05b35664bff0073e05fd1f13c7')
sha256sums_armv7h=('2b41c4a409a02e87e1de26a760313dbc1c4b06505001e1102721978b893f4521')
sha256sums_i686=('fbc22ef61aeba60d7cf04813c49e43fd83e51afecf8fd839bc43ab19fee09fbe')

package() {
    case "$CARCH" in
        x86_64)  _bin="untrunc-gui-linux-amd64" ;;
        aarch64) _bin="untrunc-gui-linux-arm64" ;;
        armv7h)  _bin="untrunc-gui-linux-armv7" ;;
        i686)    _bin="untrunc-gui-linux-i386" ;;
    esac

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
}
