# Maintainer: Steve <steveast@github>
pkgname=torflash-bin
pkgver=1.10.0
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
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/steveast/torflash/v${pkgver}/LICENSE"
        "torflash.desktop::https://raw.githubusercontent.com/steveast/torflash/v${pkgver}/torflash.desktop"
        "torflash.svg::https://raw.githubusercontent.com/steveast/torflash/v${pkgver}/assets/torflash.svg")
# sha256: [0] бинарник из релиза (TorFlash.sha256), [1] LICENSE, [2] .desktop,
# [3] .svg. Бинарник ОБЯЗАТЕЛЬНО пиннить при каждом релизе (хеш известен только
# после сборки): взять из ассета TorFlash.sha256 или `makepkg -g`. raw-источники
# привязаны к тегу v${pkgver} (неизменяемы), их хеши меняются только при правке
# самих файлов. Значения ниже — для v1.10.0.
sha256sums=('3547dde310ef39f8bce38fb9d9b425428f9fe25a0450d5575e342021ed7bc3fc'
            'a3663cd5165fe247e931278c4410e35fcfe8d2779a58c2888232a8c25cf3e19f'
            '8d43ee77ca723a2affb26bfd555a9f63f0c08e4d2b33bc35ea126dcd8261dd34'
            'e7ea7a293f421f2200bd96df58fa1834b070465378bcaca780a18633606e012c')
noextract=("TorFlash-${pkgver}")

package() {
    install -Dm755 "TorFlash-${pkgver}" "${pkgdir}/usr/bin/TorFlash"
    install -Dm644 torflash.desktop "${pkgdir}/usr/share/applications/torflash.desktop"
    install -Dm644 torflash.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/torflash.svg"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
