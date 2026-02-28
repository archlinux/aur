# Maintainer: Stan <iamjacke@gmail.com>
pkgname=dora-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="Beautiful TUI for media downloading (yt-dlp + ffmpeg)"
arch=('x86_64' 'aarch64')
url="https://github.com/Jacke/doradura"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
provides=('dora')
conflicts=('dora')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Jacke/doradura/releases/download/tui-v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/Jacke/doradura/releases/download/tui-v${pkgver}/dora-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cc96b37505920d6f3106688b1bfc0ef7b26e67e94468b8d81fc2eac6872f68c5')
sha256sums_aarch64=('e06b9cc8d138227c3141f0c02ad2025bd19eff86537afa0947e2ca8b4efebda4')

package() {
    local srcdir_inner="dora-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm755 "${srcdir_inner}/dora" "${pkgdir}/usr/bin/dora"
    if [[ -f "${srcdir_inner}/LICENSE" ]]; then
        install -Dm644 "${srcdir_inner}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
