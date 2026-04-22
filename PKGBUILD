# Maintainer: liberodark

pkgname=r-studio-for-linux-bin
pkgver=5.5.191739
pkgrel=2
pkgdesc="Undelete and data recovery software (non free version)"
arch=('x86_64')
url="http://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xdg-utils')
source_x86_64=("https://www.r-studio.com/downloads/RStudio5_x64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('9899ef8b18fbba2c06c97bb726c456392747304a4301605ea9b67ac6e5c6bf47cdc4b6fe89732b1f701c8146616cf79abc34aff9cbfb479b7e83dd3783f40109'
            '16a3c7e30096066b3ab1640f32c421424bfdefdb2859526d0f03dd5e173bc61450ca8371225fe7491135967ffe7c08b9c92b6d5b39bdf7a8999c85b6d7789c4a')
sha512sums_x86_64=('6cbf8d0dc1c5cc1195b52a2fbfd1508659946c19a2f1c8dbaeae73fad841b0cadd3d457694005227898fddfd808ed659c275e0855a069411c9d564c96d95e006')

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
