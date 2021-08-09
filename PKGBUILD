# Maintainer: niyanhhhhh <2093615664@qq.com>

pkgname=iwbtg
pkgver=1.0.0
pkgrel=1
pkgdesc="I Wanna Be the Guy, a nail-rippingly difficult platform adventure game(via wine)."
url="http://kayin.moe/iwbtg/"
arch=('i686' 'x86_64')
license=('custom')
depends=('wine')
source=(
    iwbtg.sh
    iwbtg.desktop
    iwbtg.png
    https://raw.githubusercontent.com/NiYanhhhhh/wine-iwbtg/master/iwbtg.exe
)
md5sums=(
    "de16e318e16a6f3022f914bbaa7c8808"
    "6985a98231c32abc72be24b479a11ee2"
    "07cab17ae7dea4a85069239eb37b5fa3"
    "7fa61f9a2f95f61cc5392fc127d5027d"
)
package() {
    cd "$srcdir"
    install -d -m755 $pkgdir/usr/share
    install -d -m755 $pkgdir/usr/share/iwbtg
    install -d -m755 $pkgdir/usr/bin
    install -m755 iwbtg.sh $pkgdir/usr/bin/$pkgname
    install -d -m755 $pkgdir/usr/share/applications
    install -d -m755 $pkgdir/usr/share/pixmaps
    install -m644 iwbtg.desktop $pkgdir/usr/share/applications
    install -m644 iwbtg.png $pkgdir/usr/share/pixmaps
    install -m644 iwbtg.exe $pkgdir/usr/share/$pkgname
}
