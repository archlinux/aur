# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=bittorrent-tracker-editor-bin
pkgver=1.33.1
pkgrel=1
pkgdesc="Software for add or remove tracker from torrent files"
arch=('x86_64')
url="https://github.com/GerryFerdinandus/bittorrent-tracker-editor/"
license=('MIT')
depends=("gtk2")
source=("https://github.com/GerryFerdinandus/bittorrent-tracker-editor/releases/download/V$pkgver/trackereditor_linux_amd64_gtk2.zip"
    "LICENSE::https://raw.githubusercontent.com/GerryFerdinandus/bittorrent-tracker-editor/master/MIT_License.txt"
)
sha512sums=('7df94965de5f39bc903f800fd43173254cf31f5deef39b5e333517c158a3aec24fc3831b4952e95b68b182a6909082c0831bf73a4f5e0f6768832c5545eabbcc'
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
