pkgname=xash3d-fwgs-bin
pkgver=a5191d8
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('17a0c2085afe76faad0eff401ede77d65fe4818e9e049cefd80ef35440f1590f')
sha256sums_aarch64=('754e832732660c3a4c298984d563774c8be071c920ed4d4b2d60e7ff4f56890a')
sha256sums_i686=('8398efe2f6d93eb1b98d37a3eefd7b20f9b493a5d47454d3a9fb12c185b98ba4')
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
