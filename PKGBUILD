# Author m101
# Maintainer Carey Minaieva <jedi2light@jedi2light.moe>

pkgname=fate-the-game
pkgver=0.2
pkgrel=3
pkgdesc="The Game is based to simulate a real life hack"
license=('custom')
source=(
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/Fate.zip"
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/fate-the-game.desktop"
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/fate-the-game.png"
   "https://master.dl.sourceforge.net/project/host-fate-dos-game/fate-the-game-launcher"
)
arch=('x86_64')
md5sums=(
    '3db0a0bbc8279477f672272d20270c89'
    '3fa39b232b412b8319c5e97284d6123a'
    '3aad39f65bef9ff83a55c255615f5ea2'
    'fb449564d16a30fe1c05660a13ba8f69'
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
    mkdir -p $pkgdir/usr/bin/
    install -m 0644 Fate.exe $pkgdir/usr/share/$pkgname/
    install -m 0644 Readme.txt $pkgdir/usr/share/doc/$pkgname/
    install -m 0644 $pkgname.desktop $pkgdir/usr/share/applications/
    install -m 0644 $pkgname.png $pkgdir/usr/share/icons/hicolor/64x64/
    install -m 0755 $pkgname-launcher $pkgdir/usr/bin/
    ln -s /usr/bin/$pkgname-launcher $pkgdir/usr/bin/fate
}

#vim: syntax=sh
