# Maintainer: liberodark

pkgname=mindmapp
pkgver=0.7.15
pkgrel=1
pkgdesc="Desktop application to draw mind maps."
arch=('x86_64')
url="https://mindmapp.org"
license=('MIT')
depends=('xdg-utils')
source_x86_64=("https://github.com/Mindmapp/mindmapp/releases/download/v${pkgver}/Mindmapp-${pkgver}.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('f8026d4136b75526311e562230decb46eb25b82d797b5580d7d00266cdd2714f75b1dfac543b2b7a1726843f6b322fec55d1c01ce466fc3e020b98e7b36d5cf5'
         '0f1ffadbec65fdea1af40502c204dd12ce9563db457c34140269791df191a4a819de871ec7b299059828d2af6a78c567046f33725af710a8ab2e398d21675ecc')
sha512sums_x86_64=('6b033fd00c18be49c799d4609ff48fac5bc406ef09a4edf8346f7967b1fdb73af6980be7cd6309945a2443df97d27da2dfa43838307e786ce8ff7726c7f83e22')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

