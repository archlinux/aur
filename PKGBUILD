# Author: Syed Adnan Kamili <adnan.kamili AT gmail D0T com>
# Maintainer: Marc Rozanc <marc AT rozanc D0T fr>

pkgname=flareget
_rel=4.8
_subrel=108
pkgver=${_rel}.${_subrel}
pkgrel=2
pkgdesc="A full featured, advanced, multi-threaded, multisegment download manager and accelerator."
arch=('i686' 'x86_64')
url="http://flareget.com"
license=('custom')
depends=('glibc>=2.13' 'qt4>=4.8.1' 'libmetalink')
install=${pkgname}.install
backup=('etc/opt/chrome/native-messaging-hosts/com.flareget.flareget.json'
        'etc/chromium/native-messaging-hosts/com.flareget.flareget.json')
source_i686=("https://flareget.com/downloads/files/flareget/rpm/i386/${pkgname}-${_rel}-${_subrel}.i386.rpm")
source_x86_64=("https://flareget.com/downloads/files/flareget/rpm/amd64/${pkgname}-${_rel}-${_subrel}.x86_64.rpm")
sha256sums_i686=("f4edc35570c2caa16ce053c7f96dc0deaa2e046449aa28db7c8553ee6b23c0c5")
sha256sums_x86_64=("bf6a3869f0ec63ac6d2292e6dcb5f3aeae055e06f5b3b106ccd6dbd80b2c9e1a")

package() {
    cd $srcdir
    cp -ra usr $pkgdir/usr
    cp -ra etc $pkgdir/etc
    [[ -d $pkgdir/usr/lib64 ]] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
    #chmod 0755 $pkgdir/usr/bin/flareget
    #chmod 0755 $pkgdir/usr/bin/flareget-chrome-host
    
    # License
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    mv $pkgdir/usr/share/doc/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

