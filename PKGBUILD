# Maintainer: loadept <hi at loadept dot com>

pkgname=wirq-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A local MITM proxy for inspecting HTTP/HTTPS traffic"
url="https://github.com/loadept/wirq"
arch=('x86_64')
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1')

source=(wirq-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/wirq-linux-amd64.tar.gz)
sha256sums=('2637eb74854ad97d8c20d4317a1a731cf160cf0b339f622d71f33de6682d722e')

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
