# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-launcher-bin
pkgver=10.0.0
pkgrel=2
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
source=("$pkgname-$pkgver.7z"::"https://github.com/FlashpointProject/launcher/releases/download/10.0.0/Flashpoint-10.0.0_linux-x64.7z"
             "icon.png"::"https://aur.archlinux.org/cgit/aur.git/plain/icon.png?h=flashpoint-launcher-bin"
             "flashpoint.desktop"::"https://aur.archlinux.org/cgit/aur.git/plain/flashpoint.desktop?h=flashpoint-launcher-bin")
sha256sums=('fbcb0403c856a5b738f9837c5dbfea8e5cdc6ff2160b5423d1fd7955d98e3c2a'
                      '942e3a0c70833fadb25b3bf44503e7590d976f048d04fbe29ae4fc35dbcd5037'
                      'fe9a7031d0b092b205ffac08fb29fc5ff1d96cd29a004b16da1653cda21ce069')
md5sums=('cfdebf0c15b03c1a7a6910cc4af7df49'
                 '8d71d8d61a0a39586b81faf9addaeb7a'
                 '4c4d02df6388d9859776a629f0b775ac')

package(){

    # Symlink to binary (WIP)
    #ln -sf /opt/flashpoint/linux-unpacked/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

    # Desktop Entry
    install -Dm644  $srcdir/flashpoint.desktop $pkgdir/usr/share/applications/flashpoint.desktop

    # License
    install -Dm644 $srcdir/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon
    install -Dm644 $srcdir/icon.png "$pkgdir/usr/share/pixmaps/flashpoint.png"

    rm $srcdir/$pkgname-$pkgver.7z
    rm $srcdir/icon.png
    rm $srcdir/flashpoint.desktop

    # Application
    mkdir -p $pkgdir/opt/flashpoint $pkgdir/usr/share/pixmaps/
    cp -R $srcdir/* "$pkgdir/opt/flashpoint"
}
