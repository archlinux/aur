pkgname=xash3d-fwgs-bin
pkgver=0543b86
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('1b0c938bd24039365c5c04ed008ab60259c17508d8e5b0eee1a04cff443389ad')
sha256sums_aarch64=('b61f93e16d43c926d2118045756223f6c3c240334d17fd07323715cfef26788c')
sha256sums_i686=('3edf6b83fa9aebb86dc4c160aa0a34cba0a6f4ea8510c146b7fb39f708451ae0')
source_x86_64=("xash3d-$pkgver-linux-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-x64.tar.xz")
source_i686=("xash3d-$pkgver-linux-i686.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-i686.tar.xz")
source_aarch64=("xash3d-$pkgver-linux-arm64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
