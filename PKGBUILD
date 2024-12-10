pkgname=xash3d-fwgs-bin
pkgver=3d30dc8
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
sha256sums_x86_64=('da5f7bac1e93e25bb33125a1216041c979970cdfee459a728781767c6d06113a')
sha256sums_i686=('fa61fbecbbc1fc13dae06f55fda70f5a9d5bf56457c47251d5487d720e18bdfa')
sha256sums_aarch64=('4e14ab4d81f4c299eb239eacc05f08eacce1f4151f15a39338e80035673f439b')
source_x86_64=("xash3d-linux-x64-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-x64.tar.xz")
source_i686=("xash3d-linux-i686-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-i686.tar.xz")
source_aarch64=("xash3d-linux-arm64-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
