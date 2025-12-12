# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=fentlauncher
pkgver=1.1.0
pkgrel=1
pkgdesc="Minecraft Launcher for FENTCRAFT"
arch=('x86_64')
url="https://fentcraft.fun"
license=('custom')
depends=('icu' 'krb5' 'zlib' 'openssl')
options=('!strip' '!debug')
source=("https://github.com/xxanqw/fentlauncher-pkg/releases/download/v${pkgver}/fentlauncher-linux-x64-${pkgver}.tar.gz"
        "fentlauncher.desktop"
        "https://github.com/xxanqw/fentlauncher-pkg/releases/download/v${pkgver}/icon.png")
sha256sums=('c576646ec79739af55ab584c8670af14e2f26b90546a8c0157e6ea5ee7716774'
            '520dffc0682a23b0446c3ddfd57afca33e458623ca7ac4f8440643b8e8e3acbb'
            'ab126f045e6fc1d87198571d311a19487a76160fd4c1a2b3e1df6dc503daec5e')

package() {
    install -d "$pkgdir/opt/fentlauncher"
    cp -r "$srcdir/"* "$pkgdir/opt/fentlauncher/"
    # Clean up non-app files if any were copied (like the desktop file or icon if they are in srcdir root)
    rm -f "$pkgdir/opt/fentlauncher/fentlauncher.desktop" "$pkgdir/opt/fentlauncher/icon.png"
    
    chmod 755 "$pkgdir/opt/fentlauncher/FENTLAUNCHER"

    install -Dm644 "fentlauncher.desktop" "$pkgdir/usr/share/applications/fentlauncher.desktop"
    install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/fentlauncher.png"
}
