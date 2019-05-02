# Maintainer: liberodark

pkgname=r-studio-for-linux-bin
pkgver=4.6.3377
pkgrel=1
pkgdesc="Undelete and data recovery software (non free version)"
arch=('x86_64')
url="http://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xdg-utils')
source_x86_64=("https://www.r-studio.com/downloads/RStudio4_x64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('c33acb398f1c8cdc680b981344f51b7f1f4e651c9a215e37d38d9daae08d187b4b936e4e8eea3fa81a850a3e0803d738c160f44232abb2f5422f9d60727a77b7'
         '16a3c7e30096066b3ab1640f32c421424bfdefdb2859526d0f03dd5e173bc61450ca8371225fe7491135967ffe7c08b9c92b6d5b39bdf7a8999c85b6d7789c4a')
sha512sums_x86_64=('e250a6bc526c998e8d3f6f7a2981149098f2ed6b2c9c30a7c95a640659f51b46004d19b09159d6289678127be53c0279eab5016fe0c18fc18581ce1963c00d92')
        
package() {
  cd $srcdir
  tar xvf data.tar.gz
  cp -r usr $pkgdir
  rm $pkgdir/usr/local/R-Studio/share/{logo*,*.desktop}	
  rm $pkgdir/usr/bin/rstudio
  ln -sr /usr/local/R-Studio/bin/R-Studio $pkgdir/usr/bin/R-Studio
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
