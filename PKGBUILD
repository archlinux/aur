# Maintainer: spsf64
# Contributor: thomasqueirozb

pkgname=r-linux-bin
pkgver=5.6.175721
pkgrel=1
pkgdesc="Undelete and data recovery software (free version)"
arch=('x86_64')

#url="http://www.r-tt.com/data_recovery_linux/"
url="https://www.r-studio.com/free-linux-recovery/Download.shtml"

license=('custom')
depends=('xdg-utils')
#source_x86_64=("https://www.r-studio.com/downloads/RStudio5_x64.deb")
source_x86_64=("https://www.r-studio.com/downloads/RLinux5_x64.deb")

source=($pkgname.desktop
        $pkgname.png)
sha512sums=('adaa46d144cfcdbdc8febf70f2eaa424a9471b9e393dc468138025375d4241db48bd43e1301cace27fac9bf7c30a6c477eb02783817d786c4fd28729669c7c56'
            '8d3e8f73f7e1ae8503de9cfa324a4737e7cb99bd603e1e4b8a9ec338cb087ddda9a1ab01ebbb8fc63bcbe4401b8b38ae6a6452e633e9b306497e62500e798720')
sha512sums_x86_64=('2a3c627426272c5fca273ff0a3bd2f9d4c78dcaf7c056d9c8ddd9aafcbeb01064ae8ca8b0becb9d21ad446e82a8c115564ed2cc48e07daa160d2567a17c863fc')
        
package() {
  cd $srcdir
  tar xvf data.tar.gz
  cp -r usr $pkgdir
  rm $pkgdir/usr/local/R-Linux/share/{logo*,*.desktop}	
  rm $pkgdir/usr/bin/rlinux
  ln -sr /usr/local/R-Linux/bin/R-Linux $pkgdir/usr/bin/R-Linux
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
