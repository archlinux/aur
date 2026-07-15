# Maintainer: Nicoletta <info@pc-wittfoot.de>

pkgname=kater-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux-Adressbuch mit vollständiger vCard 4.0-Unterstützung"
arch=('x86_64')
url="https://github.com/nicolettas-muggelbude/Kater"
license=('GPL-3.0-or-later')
depends=('fuse2')
provides=('kater')
conflicts=('kater')
source=(
    "kater-${pkgver}-x86_64.AppImage::https://github.com/nicolettas-muggelbude/Kater/releases/download/v${pkgver}/Kater-${pkgver}-x86_64.AppImage"
    "kater.desktop"
    "kater.svg"
)
sha256sums=(
    '6ed75561144362f7c7282d8aa1a73ce225e9036ab43a127b4053bb17f7edfd1b'
    'eb92c8ad7efa493e26fd4842361e1178e664c736d2c212ab80ae913ca5441891'
    '5a55e19a4c9eb87c0abfd9b89234c8b55df9a2b127cd260c10287a11604922b9'
)

package() {
    install -Dm755 "kater-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/kater/kater.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/kater/kater.AppImage "${pkgdir}/usr/bin/kater"

    install -Dm644 kater.desktop "${pkgdir}/usr/share/applications/kater.desktop"
    install -Dm644 kater.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kater.svg"
}
