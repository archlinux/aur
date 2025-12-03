# Maintainer: k4ditano <k4ditano@h2r.es>
pkgname=notnative-app-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Note-taking application with Vim-like keybindings, MCP server (40+ tools), AI chat, and smart tags (binary package)"
arch=('x86_64')
url="https://github.com/k4ditano/notnative"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libadwaita' 'gtksourceview5' 'libpulse' 'sqlite' 'mpv' 'mujs' 'yt-dlp')
optdepends=(
    'openai-api-key: For AI chat functionality'
    'waybar: For system tray integration'
)
provides=('notnative-app')
conflicts=('notnative-app')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/notnative-$pkgver-x86_64.tar.gz")
sha256sums=('be5aca528c300ee79e0cead0a5a40bacb8824ebc54c6e4e16b4c703ca7b12379')
package() {
    cd "$srcdir"
    install -Dm755 "notnative-app" "$pkgdir/usr/bin/notnative-app"
    install -Dm755 "notnative-control.sh" "$pkgdir/usr/bin/notnative-control"
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/notnative-app/assets/style.css"
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
