pkgname=xash3d-fwgs-bin
pkgver=f0b4c42
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
sha256sums_x86_64=('c692af150b7bb879f4983b984d5459ad1ee4c10aae8e2e5b1b2e238918b990e9')
sha256sums_i686=('ca3e37f381be93f5c0ab0846b61a7face9e696574a5d970d869972455904e2b2')
sha256sums_aarch64=('4f90d8ed73ab0fc27beac74899c56e4f2b2ea0af8c30ff87c34d4e180cda6c6c')
source_x86_64=("$url/$pkgver/-/raw/main/xash3d-linux-x64.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/xash3d-linux-i686.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/xash3d-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
