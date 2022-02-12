# Maintainer: liberodark

pkgname=r-studio-for-linux-bin
pkgver=4.10.4043
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
sha512sums_x86_64=('4d961fa77df72c5f27a44ad8e1bd79a093123aa5000603b311c78f546ecb79840aeb52728ca192421e67491b578ce9047d8663d38866cb181be4fec327260071')

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
