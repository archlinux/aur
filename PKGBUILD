pkgname=xash3d-fwgs-bin
pkgver=eda0ac9
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('3944c64d11b9bdf5aea84087d9c0303a0f23d2be914a0811adcfdb5bfef2387a')
sha256sums_aarch64=('882d959a74a8e98455bbcb30dd65aed46a9ecd83a42dd835e698d077ac7ee38a')
sha256sums_i686=('ac77ccec66acb37021f88bb1db0aa2d2b0ed187215c8ac198ad0da7deab2d443')
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
