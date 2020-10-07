#
# Maintainer: bar0metr <admin@os-admin.ru>
#

pkgname=blastem-bin
_name="blastem"
pkgver=0.6.2
pkgrel=1
pkgdesc="BlastEm is an open source, higly accurate emulator for the Genesis/Megadrive that runs on modest hardware. Stable version"
url="https://www.retrodev.com/blastem/"
arch=("x86_64")
license=('GPL3')
depends=("sdl2" "glew")
provides=("$pkgname")
conflicts=("blastem" "blastem-hg" "blastem-pre")
_prever="00fb99805445"
source=("https://www.retrodev.com/blastem/blastem64-$pkgver.tar.gz"
        'BlastEM.png'
        'blastem.desktop')
md5sums=("ca411507d7783abd0264b5ac6501ebfe"
         "SKIP"
         "SKIP")

prepare() {
    mv "$srcdir/blastem64-$pkgver" "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"

    mkdir -p "$pkgdir/usr/games/$_name"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname/$_name" "$pkgdir/usr/games/$_name/$_name"
    install -Dm666 "$srcdir/$pkgname/default.cfg" "$pkgdir/usr/games/$_name/default.cfg"
    install -Dm666 "$srcdir/$pkgname/rom.db" "$pkgdir/usr/games/$_name/rom.db"
    install -Dm644 "$srcdir/$pkgname/gamecontrollerdb.txt" "$pkgdir/usr/games/$_name/gamecontrollerdb.txt"
    install -Dm644 "$srcdir/$pkgname/images/360.png" "$pkgdir/usr/games/$_name/images/360.png"
    install -Dm644 "$srcdir/$pkgname/images/ps4.png" "$pkgdir/usr/games/$_name/images/ps4.png"
    install -Dm644 "$srcdir/$pkgname/images/ps4_6b.png" "$pkgdir/usr/games/$_name/images/ps4_6b.png"
    install -Dm644 "$srcdir/$pkgname/shaders/crt.f.glsl" "$pkgdir/usr/games/$_name/shaders/crt.f.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/crt.v.glsl" "$pkgdir/usr/games/$_name/shaders/crt.v.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/default.f.glsl" "$pkgdir/usr/games/$_name/shaders/default.f.glsl"
    install -Dm644 "$srcdir/$pkgname/shaders/default.v.glsl" "$pkgdir/usr/games/$_name/shaders/default.v.glsl"
    install -Dm644 "$srcdir/BlastEM.png" "$pkgdir/usr/share/pixmaps/BlastEM.png"
    install -Dm644 "$srcdir/blastem.desktop" "$pkgdir/usr/share/applications/blastem.desktop"
    ln -s "/usr/games/$_name/$_name" "$pkgdir/usr/bin/$_name"

}
