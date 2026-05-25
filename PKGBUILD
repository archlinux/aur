# Maintainer: Steve <steveast@github>
pkgname=torflash-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Search torrents, download and auto-copy to USB flash drive with FAT32 splitting"
arch=('x86_64')
url="https://github.com/steveast/torflash"
license=('MIT')
depends=('qt5-base' 'glibc' 'openssl' 'mkvtoolnix-cli')
optdepends=('mediainfo: media info in detail panel'
            'udisks2: safe eject of USB drives')
provides=('torflash')
conflicts=('torflash')
source=("TorFlash-${pkgver}::https://github.com/steveast/torflash/releases/download/v${pkgver}/TorFlash"
        "torflash.desktop::https://raw.githubusercontent.com/steveast/torflash/main/torflash.desktop"
        "torflash.svg::https://raw.githubusercontent.com/steveast/torflash/main/assets/torflash.svg")
sha256sums=('SKIP' 'SKIP' 'SKIP')
noextract=("TorFlash-${pkgver}")

package() {
    install -Dm755 "TorFlash-${pkgver}" "${pkgdir}/usr/bin/TorFlash"
    install -Dm644 torflash.desktop "${pkgdir}/usr/share/applications/torflash.desktop"
    install -Dm644 torflash.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/torflash.svg"
    install -Dm644 <(curl -sL "https://raw.githubusercontent.com/steveast/torflash/main/LICENSE") \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
