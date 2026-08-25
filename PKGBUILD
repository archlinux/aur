# Maintainer: coveninja
pkgname=cove-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Media streaming desktop app — discover, track, and stream movies and TV shows"
arch=('x86_64')
url="https://github.com/coveninja/cove"
license=('AGPL-3.0-or-later')
depends=('mpv' 'yt-dlp')
provides=('cove')
conflicts=('cove')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coveninja/cove/releases/download/v${pkgver}/cove-linux-amd64.tar.gz")
sha256sums=('7eaaf9cddc5de11cad3de81de6a19d3a0df1f4086d5eddf1a99d69130eeb9cbe')

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
