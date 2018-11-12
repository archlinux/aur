# Maintainer: liberodark

pkgname=elcalc
pkgver=5.0.0
pkgrel=1
pkgdesc="Simple, Cross-Platform calculator built with Electron! In less than 100 lines of code."
arch=('x86_64')
url="https://github.com/elcalc/elcalc/"
license=('MIT')
depends=('xdg-utils')
source_x86_64=("https://github.com/elcalc/elcalc/releases/download/${pkgver}/elcalc_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('b078f9108b73f79b5ead6bda9a7dacc1e7806413f549c8132fe6f37548c5e93a0a7505b3397cf49a6fe8c7827ba3430b4242c2fd67fcd722482dd4372891aa14'
         'a15838f134ac3a85cb2dbbb508ee6fca18923156d17a05ef8a64778e573a28605e45475b6d4e21e3a5f00ebd1f0d4e2f6b058537c0d919e174e67444afa64ead')
sha512sums_x86_64=('806fd56ef1ceae96993e66c98caf47f13a5a4d59302637a1899ce1b969d0cc593bc32c9c458e5d216c4a500241479f4f2ac006df6e52fc7e053ac5f0c9d2a67e')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

