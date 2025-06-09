pkgname=xash3d-fwgs-bin
pkgver=c90d110
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('2f5e86f5c1e69a69ef5bfd2856de0dfc69fb77a59bc26c70361cb72eacfcf7fe')
sha256sums_aarch64=('dc9cda8560c817d5d3bb6d60a59b2b7753a161c5537aa0c06f847e0198cf6f18')
sha256sums_i686=('8c89de60932513d7bdcac805b1b89bc00ec7abdcebf6b22fd8794e3b90537528')
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
