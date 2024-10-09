pkgname=xash3d-fwgs-bin
pkgver=96f3061
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
sha256sums_x86_64=('5b54055c7e590d275a770f679aadc28dc3bb90b6fa2f3d99af7225b5efa5346b')
sha256sums_i686=('7822c8f6277eccf3c62862a7a5c894cf9560cb8ee1dd27ebac09fd6ec41e0c91')
sha256sums_aarch64=('e5f9ad9470a403fe2797fe8feb2fcc1a416757421fd84fa5a194dfbca1d1de72')
source_x86_64=("xash3d-linux-x64-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-linux-x64.tar.xz")
source_i686=("xash3d-linux-i686-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-linux-i686.tar.xz")
source_aarch64=("xash3d-linux-arm64-$pkgver-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
