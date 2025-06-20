pkgname=ruffle-bin
pkgver=2025.06.19
pkgrel=1
pkgdesc="Unnofficial Ruffle bin package that supplies binaries for Linux x64, i368 and Arm64"
arch=('x86_64' 'aarch64' 'i386' 'pentium4' 'i686')
url="https://gitlab.com/linuxbombay/ruffle-linux"
license=('Apache' 'MIT')
depends=('gtk3' 'libxcb' 'zlib' 'libxcb' 'alsa-lib' 'libxkbcommon-x11')
makedepends=('unzip')
conflicts=(ruffle-git)
sha256sums=('7670a14a3a9ffd2a231abd9232f09c817b6312b60049175324ec4d374dffc6b8'
            'f5c8c21286d89f26c4f101e317641df02bf1af0529b6ca0897f9cebc3d654d7a')
sha256sums_x86_64=('1ff64a79645d0454417f86f8b5fd23ca4e6c0b5929f8f796b6bf2a34ee96ee77')
sha256sums_aarch64=('d4c72bdeee1927adeb78674a62aebdd6fffdea744b783cac0ac33f01229ae015')
sha256sums_i386=('141549b0944a2e58d8bfafe4ec43be73a58a1a4c0ee5b9d5f68de4aa3a4d02df')
sha256sums_pentium4=('141549b0944a2e58d8bfafe4ec43be73a58a1a4c0ee5b9d5f68de4aa3a4d02df')
sha256sums_i686=('141549b0944a2e58d8bfafe4ec43be73a58a1a4c0ee5b9d5f68de4aa3a4d02df')
source=("ruffle.desktop" "ruffle.svg")
source_x86_64=("ruffle-$pkgver-x64.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz")
source_i386=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")
source_pentium4=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")
source_i686=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")
source_aarch64=("ruffle-$pkgver-arm64.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    # Link to binary
    install -Dm755 "$srcdir/ruffle" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
