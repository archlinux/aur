# Maintainer: Pierre <pierre.jap@gmail.com>
pkgname=adb-gripper
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple and modern GUI application to manage Android devices via ADB"
arch=('x86_64')
url="https://github.com/Djkawada/ADB-Gripper"
license=('GPL3')
depends=('android-tools' 'glibc')
source=("$pkgname-Linux-$pkgver::https://github.com/Djkawada/ADB-Gripper/releases/download/v$pkgver/ADB-Gripper-Linux"
        "https://raw.githubusercontent.com/Djkawada/ADB-Gripper/v$pkgver/mon_icone.ico"
        "adb-gripper.desktop")
sha256sums=('fd6d6bc23f1f2f92587185a35edd6d27a2be0fc64f9c0f6faf1c85a6d96fcc1f'
            '0679ad4bca855bc8e627a2cd58a77cf7d58e6d3b44c6619ce874dc06968aa9a2'
            '80dc54740692d5692dd0c6b72d8ebb2d5d4640278d3c445c49dcd975f13d81a7')

package() {
    # Install the binary
    install -Dm755 "$srcdir/$pkgname-Linux-$pkgver" "$pkgdir/usr/bin/$pkgname"

    # Install the icon
    install -Dm644 "mon_icone.ico" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.ico"

    # Install the desktop entry
    install -Dm644 "adb-gripper.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}