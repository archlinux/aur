# Maintainer: liberodark

pkgname=editrocket
pkgver=4.4.2
pkgrel=1
pkgdesc="The Text and Source Code Editor for Programmers"
arch=('x86_64')
url="http://www.editrocket.com/"
license=('Custom')
depends=('xdg-utils' 'jre8-openjdk')
source_x86_64=("http://downloads.editrocket.com/downloads/4_4_2/editrocket4_4_2_linux_x64.zip")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('9a03b9ea782c4931fdf05ae1bf85be6e69caeefa71c72cc281490726850e8d0fc159247446a9789b2bbfd9a108d5c800bd4f82b3d96ec44c06869bf807463a79'
         'ef2e68b94164fc2fd5dd8e3bf2ddff491701b008010e6ffddf3c1c354e2d0cecb4f63e4a3a68067792b0de9785a5304c865adbb4a7ea374f16f5ee8d00a18c9a')
sha512sums_x86_64=('7d7bdea3854dbe2528f484a86b1e61bfb96e94f42d54472856338c614e30cadc87e4a9507f7ab72c612e0446a1db9f187822c2b8c09de91c4447a89486edf9ba')
        
package() {
  cd $srcdir
  unzip editrocket4_4_2_linux_x64.zip -d build
  mkdir -p "$pkgdir/opt/editrocket"
  cp -r "build/editrocket/." "$pkgdir/opt/editrocket"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
