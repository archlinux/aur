pkgname=zmusic-bin
pkgver=1.1.12
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64' 'aarch64')
url=""
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'libsndfile' 'mpg123' 'zlib')
conflicts=("zmusic" "zmusic-git")
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
#_pkgrel_i386=1
#_pkgrel_i686=1
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/zmusic-bin/binaries/$pkgver/-/raw/main/zmusic-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/zmusic-bin/binaries/$pkgver/-/raw/main/zmusic-linux-arm64.tar.xz")
#source_i386=("zmusic-linux-i386.tar.xz")
#source_i686=("zmusic-linux-i386.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share"
    install -dm755 "$pkgdir/usr/include"

    #Removing uneeded .files
    rm -rf $srcdir/zmusic/.*
    cp -r "$srcdir/zmusic/." "$pkgdir"
}
