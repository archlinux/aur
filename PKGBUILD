# Maintainer: Ettore Chimenti <ek5.chimenti @ gmail.com>
pkgname="init-headphone"
pkgver="0.8.0"
pkgrel=1
pkgdesc="Re-enables headphone jack after sleep/suspend resume on Clevo W230SS"
arch=("any")
url="https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1313904/"
license=('GPL')
depends=("dmidecode" "python2-smbus" "python")
install=init-headphone.install
source=("init-headphone"
        "init-headphone.service"  
        "init-headphone.install"
        "init-headphone.conf")
md5sums=('c02b1055ca25970aef2d5c92e1860f8f'
         'ad3ad6f4c9157035fd7a9dd2e82184c2'
         '81b2f5e44cd18753e64a084eaff563b5'
         '77e35c3c5b8020192eec29ec1d8ad916')
        
package() {

  install -Dm 755 init-headphone  $pkgdir/usr/bin/init-headphone 

  install -Dm 755 init-headphone.conf  $pkgdir/etc/modules-load.d/init-headphone.conf

  install -Dm 755 init-headphone.service  $pkgdir/usr/lib/systemd/system/init-headphone.service  
}


