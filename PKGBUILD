pkgname=xash3d-fwgs-bin
pkgver=bf31e9f
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('fc259f59f475a5e57aae48a89cd98814294f61978fe5a31d9cdf667fbfb61afb')
sha256sums_i686=('9913ff261fe116d779e7d5083af0d1936285f390d9687cb7311646f7efbd7543')
sha256sums_aarch64=('9455aca3cc8e9422d142f5d7c3295055a12be1254db2706f959d8de0defc284c')
source_x86_64=("$url/$pkgver/-/raw/main/xash3d-linux-x64.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/xash3d-linux-i686.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/xash3d-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -n "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
