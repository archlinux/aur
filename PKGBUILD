# Maintainer: liberodark

pkgname=headset
pkgver=2.0.1
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
sha512sums_x86_64=('e9cc4ac561a52e7d7e9ed1550e17c0e4d704b2c820c9ad1fb45b600a5869559136ebf086690ee6837625ee81063c745c85e21e0d6416070a3d33d286a1410f76')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/pixmaps/*.png
  rm $pkgdir/usr/share/applications/*.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
