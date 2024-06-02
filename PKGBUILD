# Maintainer: DarkToaster <admin@darksys.pw>
pkgname=suyu-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="suyu was the continuation of the world's most popular, open-source Nintendo Switch emulator, yuzu, but is now something more. It is written in C++ with portability in mind, and we actively provide builds for Windows, Linux, Android and iOS potentially coming soon."
arch=('x86_64')
url="https://git.suyu.dev/suyu/suyu"
license=('GPL3')
depends=('fuse2')
source=("https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage"
        "suyu.desktop"
        "suyu.png")
sha256sums=('dbab16853bc1e8ad62fcaddf9b0620e690c8522fbbc6cdddcfcc958f9abb1f47'
            'SKIP'
            'SKIP')

options=("!strip")

package() {
    install -Dm755 "$srcdir/Suyu-Linux_x86_64.AppImage" "$pkgdir/usr/bin/suyu-bin"
    install -Dm644 "$srcdir/suyu.desktop" "$pkgdir/usr/share/applications/suyu.desktop"
    install -Dm644 "$srcdir/suyu.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/suyu.png"
}

