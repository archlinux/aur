# Maintainer: liberodark

pkgname=open-jardin-bin
pkgver=1.05
pkgrel=2
pkgdesc="A garden management"
arch=('x86_64')
url="https://openjardin.eu/"
license=('GPL-v3')
depends=('xdg-utils')
source_x86_64=("https://openjardin.eu/download/openjardin_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('1caee7197210b191657cc50d421ce50e5c926917139beaf003cdbaad7970bd7d6a88263c962b3d810a7ce12ef2df662a4c71ab17e23d4ba953141231cc58418a'
         '798bab296302facf5597a71d2f038de89417c0e99c63d891e6f03cafa1758bb993c762942b29b8f1caf3787d0553d15deb612f7a756ea6faef4e2348f08230e2')
sha512sums_x86_64=('8379612e7c2fe5ea7b7770344c21ccaccc6eec66ffc7c845a7559b2eecbc33fc9c914fe41854a09724f1888250ea763b744e7bca354ecc30cd9a98416f7927a4')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/openjardin/champ.png
  rm $pkgdir/usr/share/applications/*.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}