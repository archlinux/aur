pkgname=zmusic-bin
pkgver=1.1.14.r7.gf6facda
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/zmusic"
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'libsndfile' 'mpg123' 'zlib')
conflicts=("zmusic" "zmusic-git")
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('c39c79317ddaa743690b2814d0c28254f3e07ffa847f8fd52c32a99b27554c63')
sha256sums_aarch64=('58387954299c8318b53428d8dc1f2273d4970577f09803d9291c4e4e26b26b35')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/zmusic-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/zmusic-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share"
    install -dm755 "$pkgdir/usr/include"

    #Removing uneeded .files
    rm -rf $srcdir/zmusic/.*
    cp -r "$srcdir/zmusic/." "$pkgdir"
}
