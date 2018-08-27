# Maintainer: Robinhuett <aur at tripp dot xyz>

pkgname=kiss-gui
arch=(x86_64)
pkgver=2.0.11
pkgrel=2
pkgdesc="The KISS GUI is the crossplatform configuration tool for the Flyduino flight control system like the KISSfc, KISScc and KISSfcV2F7"
pkgurl="https://github.com/flyduino/kissfc-chrome-gui"
_tag=46e13e706106267e71536e210d547afb2deab3cc # Commit, because this release is untagged

depends=('nwjs-bin')
source=($pkgname-$pkgver.tar.gz::"$pkgurl/archive/$_tag.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('87c4309efef889673f69f13468ba41ac917b8839da88a85548498066c06749a1e6f180928b2aa9c56b1e88c255bc6be95ff798861a051aefd096738ce438ab17'
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
