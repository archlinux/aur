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
sha512sums=('c7fd2848a7881f42e703614132751c2a9a754004064904573b67816c174d1b1b6287378f72f2fbdeaa67df4a787978fa9c373b642a12eaac9e30a51cd70a2877'
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