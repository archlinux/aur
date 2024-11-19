pkgname=soh-bin
pkgver=8.0.6
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip')
makedepends=('unzip')
sha256sums_i686=('05d489e704334046e6f192557078747cdb5ac8bcb715cc6b97d60d21e621e90b')
sha256sums_x86_64=('599a7cfe742155995a3b88497a4189db00485abf5f14df92fb7ab802513ed224')
sha256sums_aarch64=('58d01491c47e23608cd825e67bdb23dd6882d6227af41c073e3c140d6d3c7c51')
source_i686=("soh-$pkgver-linux-i686.tar.xz::https://gitlab.com/linuxbombay/soh-bin/binaries/$pkgver/-/raw/main/soh-linux-i686.tar.xz")
source_x86_64=("soh-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh-bin/binaries/$pkgver/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("soh-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh-bin/binaries/$pkgver/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/soh"
    
    find "$srcdir" -type f \( -name "soh" -o -name '*.otr' \) -exec cp -r {} "$pkgdir/usr/share/games/soh" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/soh"
    install -Dm755 "$srcdir/soh" "$pkgdir/usr/bin"   
}
