# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=fentlauncher
pkgver=1.1.1
pkgrel=1
pkgdesc="Minecraft Launcher for FENTCRAFT"
arch=('x86_64')
url="https://fentcraft.fun"
license=('custom')
depends=('icu' 'krb5' 'zlib' 'openssl')
options=('!strip' '!debug')
source=("https://git.xserv.pp.ua/FENTTEAM/fentlauncher-pkg/releases/download/v${pkgver}/fentlauncher-linux-x64-${pkgver}.tar.gz"
        "fentlauncher.desktop"
        "https://git.xserv.pp.ua/FENTTEAM/fentlauncher-pkg/releases/download/v${pkgver}/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -d "$pkgdir/opt/fentlauncher"
    cp -r "$srcdir/"* "$pkgdir/opt/fentlauncher/"
    # Clean up non-app files if any were copied (like the desktop file or icon if they are in srcdir root)
    rm -f "$pkgdir/opt/fentlauncher/fentlauncher.desktop" "$pkgdir/opt/fentlauncher/icon.png"
    
    chmod 755 "$pkgdir/opt/fentlauncher/FENTLAUNCHER"

    install -Dm644 "fentlauncher.desktop" "$pkgdir/usr/share/applications/fentlauncher.desktop"
    install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/fentlauncher.png"
}
