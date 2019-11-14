# Maintainer: Robinhuett <aur at tripp dot xyz>

pkgname=kiss-gui
pkgver=2.0.18
pkgrel=3
pkgdesc="Crossplatform configuration tool for the Flyduino flight control system (KISS)"
arch=(x86_64)
url="https://github.com/flyduino/kissfc-chrome-gui"

depends=('nwjs-bin')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('806d0f56d9ca37e5d524420c8b236b33519e5b04e2393a9fec744300a63a91651b61cfe66eb7f80e42ca5e4e18317389acc1dda813ba99fc386100ebd5d027dd'
            '68c02635d1c6449c8aadf55dc156717b8393c422fe9bfb96a2263314762ec82b024dc5979e1cb5c275de49439a25a4d4b962c5e7b3b58406038a3673daf895f0'
            '5a43483c365a1b1134bdd176be481a0400d3807b270cf0a31a575d5a7b0de167db6d1cd182ee9443cc0c86c77fbe14bb66bb1147c230f994aab36540687536ae')

package() {
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -r "$srcdir/kissfc-chrome-gui-$pkgver/"* "$pkgdir/usr/share/$pkgname/"
  
  install -d "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D "$srcdir/kissfc-chrome-gui-$pkgver/images/icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
