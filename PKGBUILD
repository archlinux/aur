# Maintainer: Pierre <pierre.jap@gmail.com>
pkgname=adb-gripper
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple and modern GUI application to manage Android devices via ADB"
arch=('x86_64')
url="https://github.com/Djkawada/ADB-Gripper"
license=('GPL3')
depends=('android-tools' 'glibc')
source=("$pkgname-Linux-$pkgver::https://github.com/Djkawada/ADB-Gripper/releases/download/v$pkgver/ADB-Gripper-Linux"
        "https://raw.githubusercontent.com/Djkawada/ADB-Gripper/v$pkgver/mon_icone.ico"
        "adb-gripper.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "$srcdir/$pkgname-Linux-$pkgver" "$pkgdir/usr/bin/$pkgname"

    # Install the icon (converting ico to png if possible, or just installing as is. 
    # Usually Linux desktops prefer png/svg. For simplicity, we'll install the ico, 
    # but ideally it should be a png. We will assume the user might want to convert it or use it as is.)
    # Since we don't have imagemagick guaranteed, we will install the .ico
    install -Dm644 "mon_icone.ico" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.ico"

    # Install the desktop entry
    install -Dm644 "adb-gripper.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
