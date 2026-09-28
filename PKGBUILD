# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=7d2d-modlauncher-bin
pkgver=5.5.0.9
pkgrel=1
pkgdesc="7 Days to Die Mod Launcher for Linux"
arch=('x86_64')
url="https://the7d2dmodlauncher.github.io/7D2DModLauncherV5/"
license=('unknown')
depends=('glibc')
source=("https://github.com/The7D2DModLauncher/7D2DModLauncherV5/releases/download/${pkgver}/7D2DModLauncher-Linux.tar.gz"
        "7d2d-modlauncher.desktop"
        "icon.jpg")
sha256sums=('3588fd015c70d88082ef742d264cdc1ab566e761897a26fc9625ef2ab2196be5'
'SKIP'
'SKIP'
)

package() {
    install -d "$pkgdir/opt/$pkgname"

    tar -xzf "${srcdir}/7D2DModLauncher-Linux.tar.gz" -C "$pkgdir/opt/$pkgname" --strip-components=1

    chmod +x "$pkgdir/opt/$pkgname/ModLauncherV5.x86_64"
    chmod -R 755 "$pkgdir/opt/$pkgname"

    install -Dm644 "$pkgdir/opt/$pkgname/UnityPlayer.so" "$pkgdir/usr/lib/UnityPlayer.so"
    install -d "$pkgdir/usr/bin"

    ln -s "/opt/$pkgname/ModLauncherV5.x86_64" "$pkgdir/usr/bin/7d2d-modlauncher"

    install -Dm644 "${srcdir}/7d2d-modlauncher.desktop" "$pkgdir/usr/share/applications/7d2d-modlauncher.desktop"
    install -Dm644 "${srcdir}/icon.jpg" "$pkgdir/usr/share/icons/hicolor/256x256/apps/7d2d-modlauncher.jpg"
}
