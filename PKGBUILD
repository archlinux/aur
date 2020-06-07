# Maintainer: robertfoster

pkgname=iortcw-venom-mod
pkgver=6.5.2
pkgrel=1
pkgdesc="Venom Mod is a general improvement of original Rtcw game, with a new challenging and aggressive AI and some exploitation of features of id tech 3 engine, keeping the original gameplay"
arch=(any)
url="https://www.moddb.com/mods/rtcw-venom-mod"
license=('CUSTOM')
depends=('iortcw-git')
makedepends=('unrar')
noextract=("$pkgname-$pkgver.rar")
source=("$pkgname-$pkgver.rar::https://www.moddb.com/downloads/mirror/173653/121/fb58577d8b90d4709641f703718cf35e")

package() {
    cd "$srcdir"
    unrar e -o+ "$pkgname-$pkgver.rar"
    for i in $(ls *.pk3); do
        install -Dm644 $i $pkgdir/opt/iortcw/Venom\ Mod/$i
    done
    install -Dm644 autoexec.cfg $pkgdir/opt/iortcw/Venom\ Mod/autoexec.cfg
}

md5sums=('da120236f395e865e6ff379768b06d58')
