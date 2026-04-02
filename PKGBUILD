# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="Fast, secure, cross-platform database management tool with Helix/Vim keybindings"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix' 'gridix-appimage')
source=("https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix-linux-x86_64.tar.gz"
        "gridix-${pkgver}.desktop::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/gridix.desktop"
        "gridix-icon-${pkgver}.png::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/assets/branding/gridix-icon.png"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('8d317ef03ae398a91b0bf5bd426470aed4d56d65c029211717b813f3bbe800c6'
            '3a87bbb77f4a98ff45f21d3648fc5fe761352fdef4d2e82233bb96095a7b83cf'
            '5fb40df52c427b365f594d56110e21346288936f2bc2aa2b461783a1be8c35ea'
            '01132d0ac431cc5a8f34ea8ba055deb6f68d7034d8ed6f821b827f4b9195aae4')

package() {
    cd "$srcdir"
    install -Dm755 gridix "$pkgdir/usr/bin/gridix"
    install -Dm644 "gridix-${pkgver}.desktop" "$pkgdir/usr/share/applications/gridix.desktop"
    install -Dm644 "gridix-icon-${pkgver}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gridix.png"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
