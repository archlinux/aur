# Maintainer: k4ditano <k4ditano@h2r.es>
pkgname=notnative-app-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Note-taking application with Vim-like keybindings (binary package)"
arch=('x86_64')
url="https://github.com/k4ditano/notnative-app"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libadwaita' 'gtksourceview5' 'libpulse' 'sqlite' 'mpv' 'mujs')
provides=('notnative-app')
conflicts=('notnative-app')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/notnative-app-bin-$pkgver-x86_64.tar.gz")
sha256sums=('51dd5080c6843c52e0b5ef2785daffeb56d5d3b8a931e8d3dba4f389dedb292a')

package() {
    cd "$srcdir/notnative-app-bin-$pkgver"

    # Instalar binario
    install -Dm755 "notnative-app" "$pkgdir/usr/bin/notnative-app"
    
    # Instalar archivos de desktop
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    
    # Instalar assets
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/notnative-app/assets/style.css"
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    
    # Instalar documentación
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
