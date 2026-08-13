# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Viewer, editor, CLI and MCP server for tabular data: 30+ formats, SQL, databases, cloud (pre-compiled)"
arch=('x86_64')
url="https://github.com/thorstenfoltz/octa"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'openssl' 'fontconfig' 'freetype2' 'harfbuzz' 'fribidi')
provides=('octa')
conflicts=('octa')
options=(!debug)
source=("octa-$pkgver-linux-x86_64.tar.gz::$url/releases/download/$pkgver/octa-$pkgver-linux-x86_64.tar.gz")
sha256sums=('bbed972fe7db7ec9d42b42fd4dbede07a10011b01d36e049768af2c3630b47da')

package() {
    cd "octa-$pkgver-linux-x86_64"
    install -Dm755 "octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/octa/LICENSE"
    # The release tarball ships a pre-rendered man page (see release.yml).
    install -Dm644 "octa.1" "$pkgdir/usr/share/man/man1/octa.1"
}
