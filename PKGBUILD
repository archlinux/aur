# Maintainer: willker <willker at proton dot me>

pkgname=nipaplay-reload-bin
_pkgname=NipaPlay
_desktop_name=io.github.MCDFsteve.NipaPlay-Reload
pkgver=1.10.4
pkgrel=1
pkgdesc="一个现代化的跨平台视频播放器"
arch=('x86_64')
url="https://github.com/MCDFsteve/NipaPlay-Reload"
license=('MIT')
depends=('mpv' 'gtk3' 'ffmpeg' 'libass' 'libkeybinder3' 'libayatana-appindicator')
provides=("${pkgname%-reload-bin}" "${pkgname%-bin}")
conflicts=("${pkgname%-reload-bin}" "${pkgname%-bin}")
options=('!debug')
source=(
    "${pkgname%-reload-bin}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-amd64.tar.gz"
    "${_desktop_name}.png::${url}/raw/main/assets/icons/flatpak/hicolor/512x512/apps/io.github.MCDFSteve.NipaPlay-Reload.png"
    "${_desktop_name}.desktop::${url}/raw/main/assets/linux/${_desktop_name}.desktop"
    "${url}/raw/main/LICENSE"
)
sha256sums=('1692836a791b904d9e9d424b21ff27aa99f89304d86cb8b4eaedd7b5b03e44b9'
            '4934ca32b909327939cdc25f069e88f773c718073bee46db42b79d30e715d5c3'
            'd032abed9d298e87825e842b2181a9379292acefae775e9bd2840f264eaba16f'
            'fd1d762b5ea1f4cd690235a1b8d6b8efe4ada061f5b26c1fefbd74c156f8184b')

package() {
    install -Dm755 "NipaPlay" "${pkgdir}/opt/${pkgname%-reload-bin}/NipaPlay"

    cp -rp "lib" "${pkgdir}/opt/${pkgname%-reload-bin}/"
    cp -rp "data" "${pkgdir}/opt/${pkgname%-reload-bin}/"

    install -Dm644 "${srcdir}/${_desktop_name}.desktop" "${pkgdir}/usr/share/applications/${_desktop_name}.desktop"
    install -Dm644 "${srcdir}/${_desktop_name}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_desktop_name}.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
