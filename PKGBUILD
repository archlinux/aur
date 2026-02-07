# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=kirastudio-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="KiraStudio is a lightweight, cross-platform music studio built around clarity and automation."
arch=('x86_64')
depends=('wine')
makedepends=('unzip')
source=("https://github.com/BleuBleu/KiraStudioPublic/releases/download/1.0.0/KiraStudio100-WinPortableExe.zip" 'kirastudio.desktop' 'kirastudio.png' 'kirastudio-launcher')
sha256sums=(
  'SKIP'
  '87c2879329d1770757383c783f56bac329349776862e9b98be28c076e8235021'
  'f735588984caeed04c40834de667ee156492cc355f764195415569c9344ce7ed'
  'bf376aa2f52b0b9b81bf354f588ee173ae6a50d340bd50e3ed8368f3006e7c3b'
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    cp -r "$srcdir/" "$pkgdir/usr/share/kirastudio"
    mv "$srcdir/kirastudio-launcher" "$pkgdir/usr/bin/kirastudio"
    mv "$srcdir/kirastudio.desktop" "$pkgdir/usr/share/applications/kirastudio.desktop"
    mv "$srcdir/kirastudio.png" "$pkgdir/usr/share/icons/kirastudio.png"
    chmod +x "$pkgdir/usr/bin/kirastudio"
}
