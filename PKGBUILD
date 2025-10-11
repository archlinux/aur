pkgname=zmusic-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/zmusic"
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'libsndfile' 'mpg123' 'zlib')
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('unzip')
provides=('zmusic=${pkgver}')
conflicts=('zmusic')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('77b263bee967fbf75ce6b68cd5231586249dc61dce8bb4ec366b474cae830571')
sha256sums_aarch64=('cce3fd057b8148bc3328655fe1d04437c5ad46901e1e45c0c04a067f1ae381ae')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/zmusic-$pkgver-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/zmusic-$pkgver-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share"
    install -dm755 "$pkgdir/usr/include"

    #Removing uneeded .files
    rm -rf $srcdir/zmusic/.*
    cp -r "$srcdir/zmusic/." "$pkgdir"
}
