# Maintainer: Stan <iamjacke@gmail.com>
pkgname=dora-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Beautiful TUI for media downloading (yt-dlp + ffmpeg)"
arch=('x86_64')
url="https://github.com/Jacke/doradura"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
provides=('dora')
conflicts=('dora')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jacke/doradura/releases/download/tui-v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('73e86fc2e2bb21c1a5b06961fe2dc6b53023ca7dd3a114ead303bfb92536282b')

package() {
    # Archive extracts to dora-${pkgver}-x86_64-unknown-linux-gnu/
    local srcdir_inner="dora-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 "${srcdir_inner}/dora" "${pkgdir}/usr/bin/dora"
    # Install license if bundled
    if [[ -f "${srcdir_inner}/LICENSE" ]]; then
        install -Dm644 "${srcdir_inner}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
