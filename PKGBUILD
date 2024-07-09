pkgname=xash3d-fwgs-bin
pkgver=166bed7
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
sha256sums_x86_64=('39f43c99272f65c9a692e75ab05ac61167f7ddcf413bd86350f0f747f0649815')
sha256sums_i686=('2bdcf20e34830382044b1da840d7c2c0cb695d838aa46c3887e81b691066fa96')
sha256sums_aarch64=('5179946d8e6ede01dbee2eb4b7b61991d9c2d9f835ed5e365cec2e527e076342')
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
