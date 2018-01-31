# Maintainer: liberodark

pkgname=open-jardin
pkgver=1.0
pkgrel=1
pkgdesc="A garden management"
arch=('x86_64')
url="https://openjardin.eu/"
license=('GPL-v3')
depends=('xdg-utils')
source_x86_64=("https://openjardin.eu/download/open-jardin_1.0_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('ff1578c072038c35c2ba2bb3fcd5ce9536194394c0b17b19aac6f74bc7e0be9896a781736cd86ebb85224cbb3cfcd41dc6589a8df6b4f3c8a75bc8ef8546593e'
         '798bab296302facf5597a71d2f038de89417c0e99c63d891e6f03cafa1758bb993c762942b29b8f1caf3787d0553d15deb612f7a756ea6faef4e2348f08230e2')
sha512sums_x86_64=('ca65926b7e4374f56878380e81ea8c882d1276a25d003103bcd5a34c860c03b3cba18e55a8666f980ec52b0893298bc100eeb48df3ff057d2b2d35a350ca6118')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/openjardin/champ.png
  rm $pkgdir/usr/share/applications/*.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}