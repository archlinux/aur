# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=bittorrent-tracker-editor-bin
pkgver=1.33.0
pkgrel=2
pkgdesc="Software for add or remove tracker from torrent files"
arch=('x86_64')
url="https://github.com/GerryFerdinandus/bittorrent-tracker-editor/"
license=('MIT')
depends=("gtk2")
source=("https://github.com/GerryFerdinandus/bittorrent-tracker-editor/releases/download/V$pkgver/trackereditor_linux_amd64_gtk2.zip"
    "LICENSE::https://raw.githubusercontent.com/GerryFerdinandus/bittorrent-tracker-editor/master/MIT_License.txt"
)
sha512sums=('23fa830c27e96df25287657bb549342f99936d5d77c9df27edac8cb8ff6411d455934377514ef70aef5ad2b7730110603cef7528a8d19136caec379159070b36'
    'd806f8e78a8222011f331bd97f3ba70c225cf1e37fd67db90b63501d2d751f49936164df660f26c286005f9ed25bf5cf777ad94a8974187febd96ea3ab3a9986')
package() {
    cd "$srcdir"
    install -D -m 755 trackereditor "$pkgdir/opt/trackereditor/trackereditor"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/bittorrent-tracker-editor-bin/LICENSE"
    chmod a+w "$pkgdir/opt/trackereditor"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/trackereditor/trackereditor" "$pkgdir/usr/bin/trackereditor"
}

# vim: ts=4 sw=4 et:
