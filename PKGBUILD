# Maintainer: loadept <hi at loadept dot com>

pkgname=wirq-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="A local MITM proxy for inspecting HTTP/HTTPS traffic"
url="https://github.com/loadept/wirq"
arch=('x86_64')
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1')

source=(wirq-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/wirq-linux-amd64.tar.gz)
sha256sums=('eb9744f464661da65daf6def322107abbed79aa136f8b54ce97c50cb958a7fb6')

package() {
    install -Dm755 wirq "$pkgdir/opt/wirq/wirq"
    install -Dm644 wirq.desktop "$pkgdir/opt/wirq/wirq.desktop"
    install -Dm644 icon.png "$pkgdir/opt/wirq/wirq.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wirq/LICENSE"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"

    ln -s "/opt/wirq/wirq" "$pkgdir/usr/bin/wirq"
    ln -s "/opt/wirq/wirq.desktop" "$pkgdir/usr/share/applications/wirq.desktop"
    ln -s "/opt/wirq/wirq.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wirq.png"
}
