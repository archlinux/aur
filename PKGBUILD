# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=bittorrent-tracker-editor-bin
pkgver=1.33.0.beta.5
pkgrel=1
pkgdesc="Software for add or remove tracker from torrent files"
arch=('x86_64')
url="https://github.com/GerryFerdinandus/bittorrent-tracker-editor/"
license=('MIT')
depends=("gtk2")
source=("https://github.com/GerryFerdinandus/bittorrent-tracker-editor/releases/download/$pkgver/trackereditor_linux_amd64.zip"
        "LICENSE::https://raw.githubusercontent.com/GerryFerdinandus/bittorrent-tracker-editor/master/MIT_License.txt"
)
md5sums=('9e165a8d8de75a99bd2c4109eefb707f'
         '67fc79e3a495880245a6abd65c47320b'
)
package() {
    cd "$srcdir"
    install -D -m 755 trackereditor "$pkgdir/opt/trackereditor/trackereditor"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/bittorrent-tracker-editor-bin/LICENSE"
    mkdir - p "$pkgdir/usr/bin"
    ln -sf "/opt/trackereditor/trackereditor" "$pkgdir/usr/bin/trackereditor"
}

# vim: ts=4 sw=4 et:

