# Maintainer: liberodark

pkgname=headset
pkgver=1.6.1
pkgrel=1
pkgdesc="A music player for the busy ones"
arch=('x86_64')
url="https://github.com/headsetapp/headset-electron"
license=('MIT')
depends=('xdg-utils')
source_x86_64=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}/headset_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('ab8248956308f6e5f1e9fcca38430cdb9f0fc6b1a03decf17da4b3c5c1f9d2a60c41d98face860172e15e0f23f89cc9c5fd6f6430e7762ec35d033b0772c18d2'
         'a86076ab8b9f0f110e0ded37f3538339eaa2fb2c9fa28ce1cbadbc9e3980a5cbc52b11e4800e25eb55eab906078bcec60f20923d6e72121c8d7ccd56d24e6b36')
sha512sums_x86_64=('f19b10a71d7a552acb71ab7e5330fd82f5de8a5136ed7c48b4420f3c2100a1b8a6f074c2b7afe4cfbd4dfe5308fb8c95bf742e4546d45c81045aed249154afae')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/pixmaps/*.png
  rm $pkgdir/usr/share/applications/*.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
