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
sha512sums=('9899ef8b18fbba2c06c97bb726c456392747304a4301605ea9b67ac6e5c6bf47cdc4b6fe89732b1f701c8146616cf79abc34aff9cbfb479b7e83dd3783f40109'
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
