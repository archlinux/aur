# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=bittorrent-tracker-editor-bin
pkgver=1.33.0.beta.6
pkgrel=2
pkgdesc="Software for add or remove tracker from torrent files"
arch=('x86_64')
url="https://github.com/GerryFerdinandus/bittorrent-tracker-editor/"
license=('MIT')
depends=("gtk2")
source=("https://github.com/GerryFerdinandus/bittorrent-tracker-editor/releases/download/$pkgver/trackereditor_linux_amd64.zip"
        "LICENSE::https://raw.githubusercontent.com/GerryFerdinandus/bittorrent-tracker-editor/master/MIT_License.txt"
)
md5sums=('1aae5289a6d4312f8c891bdc662ff061'
         'bb4a6293b41f08c9ea1b1f9755e072e7'
)
package() {
    cd "$srcdir"
    install -D -m 755 trackereditor "$pkgdir/opt/trackereditor/trackereditor"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/bittorrent-tracker-editor-bin/LICENSE"
    chmod a+w "$pkgdir/opt/trackereditor"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/trackereditor/trackereditor" "$pkgdir/usr/bin/trackereditor"
}

# vim: ts=4 sw=4 et:

