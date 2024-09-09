pkgname=xash3d-fwgs-bin
pkgver=b2273b1
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
sha256sums_x86_64=('344f6df8d89748853138728508e82ddb867d428f91da8eab20b3f5580ebeb35a')
sha256sums_i686=('3735680c1c62e0344da74ecdb9b3d4526b4505c51a4bce956641a9aae266e1b7')
sha256sums_aarch64=('d6a602ea401d0cbaea45092c903492f097104a19241d8df7e106bfd5b06ae894')
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
