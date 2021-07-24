# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-launcher-bin
pkgver=10.0.0
pkgrel=1
pkgdesc="Launcher for BlueMaxima's Flashpoint - Does not include data files! - Launcher software only."
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3'
         'libxss'
         'wine')
optdepends=('flashplayer-standalone: native Flash support')
conflicts=('flashpoint-bin' 'flashpoint-launcher-git')
source=($pkgname-$pkgver.7z::"https://github.com/FlashpointProject/launcher/releases/download/10.0.0/Flashpoint-10.0.0_linux-x64.7z")
sha256sums=('fbcb0403c856a5b738f9837c5dbfea8e5cdc6ff2160b5423d1fd7955d98e3c2a')
md5sums=('cfdebf0c15b03c1a7a6910cc4af7df49')

package(){
    # Application
    rm $srcdir/flashpoint-launcher-bin-$pkgver.7z
    mkdir -p $pkgdir/opt/flashpoint $pkgdir/usr/share/pixmaps/
    cp -R $srcdir/* "$pkgdir/opt/flashpoint"
    #cp $srcdir/$pkgname/icons/icon.png "$pkgdir/usr/share/pixmaps/flashpoint.png"
    
    # Symlink to binary (WIP)
    #ln -sf /opt/flashpoint/linux-unpacked/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

    # Desktop Entry (WIP)
    #install -Dm644 ./flashpoint.desktop "$pkgdir/usr/share/applications/flashpoint.desktop"

    # License
    install -Dm644 $srcdir/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
