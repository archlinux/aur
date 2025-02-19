pkgname=ruffle-bin
pkgver=2025.02.19
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
sha256sums_x86_64=('c5bb49f17b4dabec5d649008244abf3d86f325cf25ee05849ee8dd37f160459c')
sha256sums_aarch64=('abe2af8ef9f7106fc31cbbe6ebf33cf6e4660d9f5e7be416031820f32e502639')
sha256sums_i386=('d464ddc51301fae0a9f4cc54eafc25f711afda54a75df8c2bec4ad90911c9358')
sha256sums_pentium4=('d464ddc51301fae0a9f4cc54eafc25f711afda54a75df8c2bec4ad90911c9358')
sha256sums_i686=('d464ddc51301fae0a9f4cc54eafc25f711afda54a75df8c2bec4ad90911c9358')
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
