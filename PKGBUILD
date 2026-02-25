# Maintainer: Stan <iamjacke@gmail.com>
pkgname=dora-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Beautiful TUI for media downloading (yt-dlp + ffmpeg)"
arch=('x86_64')
url="https://github.com/Jacke/doradura"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
provides=('dora')
conflicts=('dora')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jacke/doradura/releases/download/tui-v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7a885f383202c3ade77b56ec3b33236bf845f202fabf6b1b23410507b7e029f3')

package() {
    local srcdir_inner="dora-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 "${srcdir_inner}/dora" "${pkgdir}/usr/bin/dora"
    if [[ -f "${srcdir_inner}/LICENSE" ]]; then
        install -Dm644 "${srcdir_inner}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
