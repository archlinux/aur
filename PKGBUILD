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
source=("http://unitystationfile.b-cdn.net/StationHubLinux.zip"
        "stationhub.desktop"
        "stationhub.png")
sha512sums=('SKIP'
         '7183d5ee41cd900c54cc3138c95020fd9479b512a10a0f1826587acf8fc360759e9a3d93f380b78a27c401349c6c4f89d4f69b670698cbd898ef291cfa859c48'
         'eaa545f3e22193c8f5c9292081777bdf87a1a5090f402fb146e397b7ee5a171067b953aaab9bdc07e19db75a7f555ca438c129a811855533e68f5927bd7bdf32')
conflicts=("stationhub-$pkgver")
provides=("stationhub-$pkgver")

        
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
