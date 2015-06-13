# Maintainer: McLenin <mclenin at gooogles email>

pkgname=triptych-bin
pkgver=1.6
pkgrel=3
pkgdesc="A physics tetris-like game with bouncy blocks, requires unlock code for stages 4+"
arch=("i686" "x86_64")
url="http://www.chroniclogic.com/triptych.htm"
depends_i686+=("libgl" "sdl")
depends_x86_64+=("lib32-libgl" "lib32-sdl")
license=("proprietary")
install=triptych-bin.install
source=("http://s159260531.onlinehome.us/demos/triptych.tar.gz" "triptych.sh" "triptych.xpm" "triptych-setup.sh" "triptych.desktop" "triptych-setup.desktop")
md5sums=('dfd8b505f6dbbd1f28f35399f7b55e34'
         'cc8d59a73f2354b9137e008ce7ea0aa6'
         '3bff4dc65864b7ed9876be34ea8a121a'
         'dbb82b9889d19dcf5b81ee56a6d156e9'
         'f3777040bb98867c59ff9ef3db46c708'
         'b4e47bf8c3f456e616531c52432a7abd')

package() {
        install -d "$pkgdir"/{usr/bin,usr/share/applications,usr/share/pixmaps}
        install -dm774 -g games "$pkgdir"/opt/triptych
	install -Dm644 "$srcdir"/triptych/* "$pkgdir"/opt/triptych/
        chmod +x "$pkgdir"/opt/triptych/triptych
        chmod +x "$pkgdir"/opt/triptych/setup
        rm "$pkgdir"/opt/triptych/sdl.dll
	install -Dm644 "$srcdir"/triptych.xpm "$pkgdir"/usr/share/pixmaps/triptych.xpm
        install -Dm755 "$srcdir"/triptych.sh "$pkgdir"/usr/bin/triptych
        install -Dm755 "$srcdir"/triptych-setup.sh "$pkgdir"/usr/bin/triptych-setup
        install -Dm644 "$srcdir"/triptych.desktop "$pkgdir"/usr/share/applications
        install -Dm644 "$srcdir"/triptych-setup.desktop "$pkgdir"/usr/share/applications
}
