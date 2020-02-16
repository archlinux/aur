# Maintainer: liberodark

pkgname=editrocket
pkgver=4.5.5
pkgrel=1
pkgdesc="The Text and Source Code Editor for Programmers"
arch=('x86_64')
url="http://www.editrocket.com/"
license=('Custom')
depends=('xdg-utils' 'jre8-openjdk')
source=("http://downloads.editrocket.com/downloads/4_5_5/editrocket4_5_5_linux_x64.zip"
	$pkgname.desktop
        $pkgname.png)
sha512sums=('72be1bcdb8fb5b264b5a832e79d6b3ea7a920f8a8916253c22cdb66fd27b566293d7df21d153b10e652c4fb1915ad529893067bf3558744994a97fdffea64499'
            '9a03b9ea782c4931fdf05ae1bf85be6e69caeefa71c72cc281490726850e8d0fc159247446a9789b2bbfd9a108d5c800bd4f82b3d96ec44c06869bf807463a79'
            'ef2e68b94164fc2fd5dd8e3bf2ddff491701b008010e6ffddf3c1c354e2d0cecb4f63e4a3a68067792b0de9785a5304c865adbb4a7ea374f16f5ee8d00a18c9a')
        
package() {
  cd $srcdir
  unzip editrocket4_5_0_linux_x64.zip -d build
  mkdir -p "$pkgdir/opt/editrocket"
  cp -r "build/editrocket/." "$pkgdir/opt/editrocket"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
