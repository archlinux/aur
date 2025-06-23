pkgname=spaghettikart-bin
pkgver=0.9.9.1
pkgrel=1
scriptver=1.0
rlname=SpaghettiKart
_rlname=spaghettikart
pkgdesc="Spaghetti Kart Reimplimentation engine for Mario Kart 64"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/spaghettikart"
license=('GPL')
depends=('sdl2' 'libpng' 'libzip' 'nlohmann-json' 'tinyxml2' 'spdlog' 'sdl2_net' 'boost' 'libogg' 'libvorbis' 'zenity')
makedepends=('unzip')
sha256sums=('618c128326a590b62395b2806031f513540a17e20964fe2946da92a0c64099d1')
sha256sums_x86_64=('936c1a5430cc13b583cd39fc1359b493c01a7db99fb63b66f11e9f76f0ed6d1d')
sha256sums_aarch64=('3090f078276cbe61b23dfbf18d91d59989edc21053363fb3e622072b81265ca9')
source=("https://gitlab.com/linuxbombay/spaghettikart/spaghettikart/-/archive/$scriptver/spaghettikart-$scriptver.tar.bz2")
source_x86_64=("spaghettikart-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-x64.tar.xz")
source_aarch64=("spaghettikart-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$rlname"
    install -dm755 "$pkgdir/usr/share/games/$rlname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "Spaghettify" -o -name "*.ini" -o -name "spaghettify.cfg.json" -o -name "spaghetti.o2r" -o -name "config.yml" -o -name "torch.hash.yml" \) -exec cp -rf {} "$pkgdir/usr/share/games/$rlname" \;
    cp -r "$srcdir/torch" "$pkgdir/usr/share/games/$rlname"
    cp -r "$srcdir/yamls" "$pkgdir/usr/share/games/$rlname"
    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname" "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$_rlname-$scriptver/$_rlname.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname.desktop" "$pkgdir/usr/share/applications"
}
