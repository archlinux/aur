# Maintainer: coveninja
pkgname=cove-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Media streaming desktop app — discover, track, and stream movies and TV shows"
arch=('x86_64')
url="https://github.com/coveninja/cove"
license=('AGPL-3.0-or-later')
depends=('mpv' 'yt-dlp')
provides=('cove')
conflicts=('cove')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coveninja/cove/releases/download/v${pkgver}/cove-linux-amd64.tar.gz")
sha256sums=('633f5402fa0085075606c01da3535b033800505d6d3219b4b7823cfd5b293bc2')

package() {
    install -Dm755 "${srcdir}/bin/cove"          "${pkgdir}/usr/bin/cove"
    mkdir -p "${pkgdir}/usr/lib/cove"
    cp -r "${srcdir}/lib/cove/Cove"              "${pkgdir}/usr/lib/cove/Cove"
    chmod -R a+rX                                "${pkgdir}/usr/lib/cove/Cove"
    install -Dm644 "${srcdir}/share/applications/io.github.coveninja.Cove.desktop" \
                   "${pkgdir}/usr/share/applications/io.github.coveninja.Cove.desktop"
    install -Dm644 "${srcdir}/share/icons/hicolor/scalable/apps/io.github.coveninja.Cove.svg" \
                   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.coveninja.Cove.svg"
}
