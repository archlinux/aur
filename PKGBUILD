# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=7d2d-modlauncher-bin
pkgver=5.4.0.5
pkgrel=1
pkgdesc="7 Days to Die Mod Launcher for Linux"
arch=('x86_64')
url="https://the7d2dmodlauncher.github.io/7D2DModLauncherV5/"
license=('unknown')
depends=('glibc')
source=("https://github.com/The7D2DModLauncher/7D2DModLauncherV5/releases/download/${pkgver}/7D2DModLauncher-Linux.tar.gz"
        "7d2d-modlauncher.desktop"
        "icon.jpg")
sha256sums=('325bcfaf53be700a41e67203167697e077725ec9a112c8b054a39be52d3e4866'
'df15a6fd97be45d296f68698481869de386296f3cdb279fbde385751a01ba972'
'3400314b953dc9b33eb8dad9b6bf60bcb3902ffa61ee352e231a4099da60de71'
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
