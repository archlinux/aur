# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=r-linux
pkgver=5.4.165361
pkgrel=1
pkgdesc="Undelete and data recovery software"
arch=('i686' 'x86_64')
url="http://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('sudo' 'xdg-utils')
source_i686=("https://www.r-tt.com/downloads/RLinux5_i386.deb")
source_x86_64=("http://www.r-tt.com/downloads/RLinux5_x64.deb")
source=(rlinux.sh)
sha512sums=('03096de0361b38195d346d2e5eab31b938daf1a824c3939e10232b769b60ba6f2eaf6cc55d553e76953bb6cadd3a35441fac0d0c6551e114cee970c9746cfccc'
            '16a3c7e30096066b3ab1640f32c421424bfdefdb2859526d0f03dd5e173bc61450ca8371225fe7491135967ffe7c08b9c92b6d5b39bdf7a8999c85b6d7789c4a')
sha512sums_i686=('4ca1ce945a2ec66b536b5d136b07166dfb374b0596e6c674d4eca7d6960e81baa6d21ca78088a14e844ec55a1abc7cea16a405b7880f2d8532dbba814318be92')
sha512sums_x86_64=('b8753711c6f7f1e5f6ef24aa46ac72bac454655a1241cc98ec6ff4608d7bee99fdba963d00ba59dc4c11ee126becd586c2e64507a5e16d04b56da7a2a6b19424')
sha512sums=('f6630adfd9d2ec1be384f84b53b7d3fff1b93a1ae6f1d34bc06a15eb5e8fd07be28c2c1fcbd6de8d331ac6bda8659eee25e0a03163181f8757f3f15368e72f74')
        
package() {
  cd $srcdir

  tar xvf data.tar.gz
  cp -r usr $pkgdir

  rm $pkgdir/usr/bin/rlinux

  install -Dm 755 $srcdir/rlinux.sh $pkgdir/usr/bin/rlinux
  install -Dm 644 $pkgdir/usr/local/R-Linux/share/logo_48.png $pkgdir/usr/share/pixmaps/rtt-rlinux.desktop
  install -Dm 644 $pkgdir/usr/local/R-Linux/share/rtt-rlinux.desktop $pkgdir/usr/share/applications/rtt-rlinux.desktop
}
