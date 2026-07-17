# Maintainer: coveninja
pkgname=cove-bin
pkgver=0.26.7
pkgrel=1
pkgdesc="Media streaming desktop app — discover, track, and stream movies and TV shows"
arch=('x86_64')
url="https://github.com/coveninja/cove"
license=('GPL-3.0-or-later')
depends=('qt6-webengine' 'qt6-webchannel' 'mpv')
provides=('cove')
conflicts=('cove')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coveninja/cove/releases/download/v${pkgver}/cove-linux-amd64.tar.gz")
sha256sums=('cc0fd259656ba3c2bc58d717d036e4771769fbb8affa2f7976a79882bdbd7808')

package() {
    install -Dm755 "${srcdir}/bin/cove"                "${pkgdir}/usr/bin/cove"
    install -Dm755 "${srcdir}/lib/cove/cove"           "${pkgdir}/usr/lib/cove/cove"
    install -Dm755 "${srcdir}/lib/cove/cove_shell"     "${pkgdir}/usr/lib/cove/cove_shell"
    mkdir -p "${pkgdir}/usr/share/cove"
    cp -r "${srcdir}/share/cove/web"                   "${pkgdir}/usr/share/cove/"
    install -Dm644 "${srcdir}/share/applications/io.github.coveninja.Cove.desktop" \
                   "${pkgdir}/usr/share/applications/io.github.coveninja.Cove.desktop"
    install -Dm644 "${srcdir}/share/icons/hicolor/scalable/apps/io.github.coveninja.Cove.svg" \
                   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.coveninja.Cove.svg"
}
