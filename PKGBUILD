pkgname=2s2h-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip')
makedepends=('unzip')
sha256sums_x86_64=('5f3f84281c634289a68a31735ba96bcd9fc64b8147efb8265f368eaf4f7359f8')
sha256sums_aarch64=('a36ac89fd36cb4e19afa1ca902df34081666252dc4bdb2d13a1cd0bebdad5979')
source_x86_64=("$url/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name '*.o2r' -o -name '*.ini' -o -name '*.json' \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    ln -s /usr/share/games/2s2h/2s2h "$pkgdir/usr/bin"
}
