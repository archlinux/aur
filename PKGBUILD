# Maintainer: liberodark

pkgname=editrocket
pkgver=4.5.0
pkgrel=1
pkgdesc="The Text and Source Code Editor for Programmers"
arch=('x86_64')
url="http://www.editrocket.com/"
license=('Custom')
depends=('xdg-utils' 'jre8-openjdk')
source_x86_64=("http://downloads.editrocket.com/downloads/4_5_0/editrocket4_5_0_linux_x64.zip")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('9a03b9ea782c4931fdf05ae1bf85be6e69caeefa71c72cc281490726850e8d0fc159247446a9789b2bbfd9a108d5c800bd4f82b3d96ec44c06869bf807463a79'
         'ef2e68b94164fc2fd5dd8e3bf2ddff491701b008010e6ffddf3c1c354e2d0cecb4f63e4a3a68067792b0de9785a5304c865adbb4a7ea374f16f5ee8d00a18c9a')
sha512sums_x86_64=('9e1273079bc813e215c074adb28f10bd40ea41229bde6a576eb0deface60876ae513864876b071e5cf51aee64a75c361e92006c255796709756346b21085941a')
        
package() {
  cd $srcdir
  unzip editrocket4_5_0_linux_x64.zip -d build
  mkdir -p "$pkgdir/opt/editrocket"
  cp -r "build/editrocket/." "$pkgdir/opt/editrocket"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
