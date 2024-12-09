pkgname=soh-bin
pkgver=8.0.6
pkgrel=2
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('tinyxml2' 'sdl2' 'sdl2_net' 'libpng' 'libzip')
makedepends=('unzip')
sha256sums_i686=('c4588d0939d72cdb385896a568c57dc0dd16a4de01fe8d875a5241674c3eb6c2')
sha256sums_x86_64=('20b1d1c844e0127c0562b3bec2a97e7f88b41c86784dcd60cb5f6720449d3adf')
sha256sums_aarch64=('57bbab879625370ee0fe4f393fc6d31656e4571cb020b2f058882840a234c6f8')
source_i686=("soh-$pkgver-$pkgrel-linux-i686.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-$pkgrel/-/raw/main/soh-linux-i686.tar.xz")
source_x86_64=("soh-$pkgver-$pkgrel-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-$pkgrel/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("soh-$pkgver-$pkgrel-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver-$pkgrel/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/soh"
    
    find "$srcdir" -type f \( -name "soh" -o -name '*.otr' \) -exec cp -r {} "$pkgdir/usr/share/games/soh" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/soh"
    install -Dm755 "$srcdir/soh" "$pkgdir/usr/bin"   
}
