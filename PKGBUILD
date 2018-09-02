# Maintainer: Robinhuett <aur at tripp dot xyz>

pkgname=kiss-gui
arch=(x86_64)
pkgver=2.0.12
pkgrel=1
pkgdesc="The KISS GUI is the crossplatform configuration tool for the Flyduino flight control system like the KISSfc, KISScc and KISSfcV2F7"
pkgurl="https://github.com/flyduino/kissfc-chrome-gui"
_tag=2.0.12

depends=('nwjs-bin')
source=($pkgname-$pkgver.tar.gz::"$pkgurl/archive/v$_tag.tar.gz" # Added "v" because of inconsitent tagging
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('64d939143c63d673c70b4e6ea7f268534ed9af5ba23d4c30bc458079fd8b69339effb7f1fb7ff833f1f5df6a7c9be6c8f30e7d2f1cf9717cf6aafacb5cc6b63c'
            '68c02635d1c6449c8aadf55dc156717b8393c422fe9bfb96a2263314762ec82b024dc5979e1cb5c275de49439a25a4d4b962c5e7b3b58406038a3673daf895f0'
            '5a43483c365a1b1134bdd176be481a0400d3807b270cf0a31a575d5a7b0de167db6d1cd182ee9443cc0c86c77fbe14bb66bb1147c230f994aab36540687536ae')
options=(!strip)

package() {
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -r $srcdir/kissfc-chrome-gui-$_tag/* "$pkgdir/usr/share/$pkgname/"
  
  install -d "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D "$srcdir/kissfc-chrome-gui-$_tag/images/icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
