pkgname=xash3d-fwgs-bin
pkgver=1677835
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/half-life1"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/half-life1/binaries/$pkgver/-/raw/main/xash3d-fwgs-linux-x64.tar.xz")
source_i686=("https://gitlab.com/half-life1/binaries/$pkgver/-/raw/main/xash3d-fwgs-linux-i686.tar.xz")
source_aarch64=("https://gitlab.com/half-life1/binaries/$pkgver/-/raw/main/xash3d-fwgs-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -n "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
