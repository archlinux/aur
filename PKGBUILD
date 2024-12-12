pkgname=soh-bin
pkgver=8.0.6
pkgrel=3
scriptver=1.0.0
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2')
makedepends=('unzip')
sha256sums=('59dabfcc0744b2b727d704d4ec5fb63f68f874d2db3a5600495f7d6f3b75c6d4')
sha256sums_i686=('a805c482ed59289fc8e7fc32da47bf356fe1e13412dc10af126c2fd783ca90d7')
sha256sums_x86_64=('569e9b76c523b08f3bc9b305fd0fb1709aa631ba2879779499244371b7326caa')
sha256sums_aarch64=('dfcc0d58cd282325efdc614ca78189daea178b27653cd1006641a60ccdbda54f')
source=("https://gitlab.com/linuxbombay/soh/shipwright/-/archive/$scriptver/shipwright-$scriptver.tar.bz2")
source_i686=("soh-$pkgver-2-linux-i686.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-2/-/raw/main/soh-linux-i686.tar.xz")
source_x86_64=("soh-$pkgver-2-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-2/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("soh-$pkgver-2-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-2/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/Shipwright"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "soh" -o -name "*.ini" -o -name "*.json" -o -name "*.otr" \) -exec cp -r {} "$pkgdir/usr/share/games/Shipwright" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.sh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
