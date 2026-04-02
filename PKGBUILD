# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Fast, secure, cross-platform database management tool with Helix/Vim keybindings"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix')
source=("https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix-linux-x86_64.tar.gz"
        "gridix.desktop"
        "LICENSE::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('4dfc0f817876cc26972d740b0b5d1ceb989a2ea7920b270fc26283e49aebb3b3'
            'e1f60a98424e119448c72fc03b725348355e1218457234e4576852bfebda557d'
            '6850b0e5d07bed32b3613d4c7da50e0fc36542239a5ff5188b524494e9edda75')

package() {
    cd "$srcdir"
    install -Dm755 gridix "$pkgdir/usr/bin/gridix"
    install -Dm644 gridix.desktop "$pkgdir/usr/share/applications/gridix.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
