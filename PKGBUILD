# Author: Syed Adnan Kamili <adnan.kamili AT gmail D0T com>
# Maintainer: Marc Rozanc <marc AT rozanc D0T fr>

pkgname=flareget
_rel=4.7
_subrel=106
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
sha256sums_i686=("4e36f2da71b9203ddd0f1816da03900991234a2a588f7dc3123918227270895b")
sha256sums_x86_64=("7b5b89fe18d195bfbf550cea44c161128c05df628f648f28cc1a386c2ab4d3eb")

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

