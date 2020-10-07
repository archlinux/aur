# Maintainer: spsf64
# Contributor: thomasqueirozb

pkgname=r-linux-bin
pkgver=5.6.175721
pkgrel=2
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
            '27469289017d153bb8daf6708bc60cdd9ae34280e684f6b41e5db6ddfe14c942aee8e5b0d99a9ebb1ff66a2a1f6ff328e99dc99905685e83c29090b35f8f4681')
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
