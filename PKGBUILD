pkgname=ruffle-bin
pkgver=2025.01.19
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
sha256sums_x86_64=('8da02877cf4adeea93457c7bef3a191f4b8576def26557ae3f95388f94ca796b')
sha256sums_aarch64=('8e1d317b12bfacbb09c23f0c91ddf714116d6e974764eec93fba47f1cd042679')
sha256sums_i386=('b9f2b4a636f4e1bb5b9952028be442c5ac9630d38b44636d876b059d4cd6cf49')
sha256sums_pentium4=('b9f2b4a636f4e1bb5b9952028be442c5ac9630d38b44636d876b059d4cd6cf49')
sha256sums_i686=('b9f2b4a636f4e1bb5b9952028be442c5ac9630d38b44636d876b059d4cd6cf49')
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
