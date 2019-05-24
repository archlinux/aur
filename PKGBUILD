# Author m101
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=fate-the-game
pkgver=0.2
pkgrel=1
pkgdesc="The Game is based to simulate a real life hack"
license=('custom')
source=(
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/Fate.zip"
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/fate-the-game.desktop"
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/fate-the-game.png"
)
arch=('x86_64')
md5sums=(
    '3db0a0bbc8279477f672272d20270c89'
    '0a585e4d38a2b7a62a8895ae2bf4eef3'
    '3aad39f65bef9ff83a55c255615f5ea2'
)
depends=(
   dosbox
)

prepare() {
    cd $srcdir/
    7z -y x Fate.zip
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/share/doc/$pkgname/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/
    install -m 0644 Fate.exe $pkgdir/usr/share/$pkgname/
    install -m 0644 Readme.txt $pkgdir/usr/share/doc/$pkgname/
    install -m 0644 $pkgname.desktop $pkgdir/usr/share/applications/
    install -m 0644 $pkgname.png $pkgdir/usr/share/icons/hicolor/64x64/
}

#vim: syntax=sh
