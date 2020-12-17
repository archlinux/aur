# Author: Syed Adnan Kamili <adnan.kamili AT gmail D0T com>
# Maintainer: Marc Rozanc <marc AT rozanc D0T fr>

pkgname=flareget
_rel=5.0
_subrel=0
pkgver=${_rel}.${_subrel}
pkgrel=2
pkgdesc="A full featured, advanced, multi-threaded, multisegment download manager and accelerator."
arch=('i686' 'x86_64')
url="https://flareget.com"
license=('custom')
depends=('glibc>=2.13' 'qt5-base>=5.7.1' 'nss>=3.26')
install=${pkgname}.install
backup=('etc/opt/chrome/native-messaging-hosts/com.flareget.flareget.json'
        'etc/chromium/native-messaging-hosts/com.flareget.flareget.json')
source_i686=("https://dl.flareget.com/downloads/files/flareget/rpm/i386/${pkgname}-${_rel}-${_subrel}.i386.rpm")
source_x86_64=("https://dl.flareget.com/downloads/files/flareget/rpm/amd64/${pkgname}-${_rel}-${_subrel}.x86_64.rpm")
sha256sums_i686=("f2f1febed7a1a4f58db92bc076f0641b1eac53124b6b3c8ee730a6e8a6134686")
sha256sums_x86_64=("977bdd8ecf2c44611a24beca578c5796473e8be700f752ea5e1b74bd412bb32f")

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

