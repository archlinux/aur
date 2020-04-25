# Maintainer: Zagamun <courteouscastellan at gmail dot com>
pkgname=stationhub
pkgver=0.4
pkgrel=1
pkgdesc="The Station Hub for Unitystation, an open source remake of Space Station 13 on the Unity engine."
arch=('x86_64')
url="https://unitystation.org/"
license=('AGPL v3')
install=stationhub.install
options=(staticlibs)
source=("https://unitystationfile.b-cdn.net/StationHubLinux.zip"
        "stationhub.desktop"
        "stationhub.png")
sha256sums=('SKIP'
         '0373d2ccaa58f12b11e0a1be70de63f27858b5dc46346ae7a6a8727a74dbcaba'
         'ddfc55857b2243a732b6003f0ba1e0fb8ee7f16562a4abc572f09461b6494625')

        
package() {

    #Install Main Files
    cd $srcdir
    install -dm755 $pkgdir/opt/$pkgname
    cp -r $srcdir/* $pkgdir/opt/$pkgname

    #Permissions
    find $pkgdir/opt/$pkgname -type d -exec chmod 777 {} +
    find $pkgdir/opt/$pkgname -type f -exec chmod 777 {} +
    
    #Desktop file
    install -Dm644 $srcdir/stationhub.desktop $pkgdir/usr/share/applications/stationhub.desktop
    install -Dm644 $srcdir/stationhub.png $pkgdir/usr/share/pixmaps/stationhub.png
    
    #Remove Holdovers
    rm $pkgdir/opt/$pkgname/StationHubLinux.zip
    rm $pkgdir/opt/$pkgname/stationhub.desktop
    rm $pkgdir/opt/$pkgname/stationhub.png
    
    
}
