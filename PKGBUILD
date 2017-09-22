# Maintainer: liberodark

pkgname=odrive-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Google Drive GUI"
arch=('x86_64')
url="https://github.com/liberodark/ODrive"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/ODrive/releases/download/0.1.1/odrive-linux-x64.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('8c498921bb26768f9d54324ece38b41e7980d6ed2117ab5843cadb3ce6efa38da4158b28909dd01422ed45c2dc200f7f199c353c3856f517363ebd6a4d1c69eb'
         'e852e6ee2714900b2b484dbe3f9bb69e72895391fed5e6776142c48daaf7e75a8a12908812894e5695277447bd2704cad93cd4f2ed0940ef45008e93b8823dd1')
sha512sums_x86_64=('5cae7c97447e4251ec2df4d75dba088f4082fafdf3217c562cd795ffe2bf1d40bbd8599f855d2a11bb63f449c4308916f59dab373f5906d1d1bd170e91e71f45')
        
package() {
  cd $srcdir
  tar xvf odrive-linux-x64.tar.gz
  mkdir -p "$pkgdir/usr/bin/odrive"
  cp -r "odrive-linux-x64/." "$pkgdir/usr/bin/odrive"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

