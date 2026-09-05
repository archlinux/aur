# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa-bin
pkgver=0.19.0
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
sha256sums=('9043d485e2224f28a3a6b494f8ac32dd72f7c063e4395c5e513bc42e1786c044')

package() {
    cd "octa-$pkgver-linux-x86_64"
    install -Dm755 "octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/octa/LICENSE"
    install -Dm644 "NOTICE" "$pkgdir/usr/share/licenses/octa/NOTICE"
    install -Dm644 "THIRD_PARTY_LICENSES.md" \
        "$pkgdir/usr/share/licenses/octa/THIRD_PARTY_LICENSES.md"
    install -Dm644 -t "$pkgdir/usr/share/licenses/octa/licenses" licenses/*.txt
    # The release tarball ships a pre-rendered man page (see release.yml).
    install -Dm644 "octa.1" "$pkgdir/usr/share/man/man1/octa.1"
}
