pkgname=xash3d-fwgs-bin
pkgver=f4a7730
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
sha256sums_x86_64=('12adb3b5c1fd1c9adae7ab9eef2fb9e4dcc0802b154f56c776c7284f13243d05')
sha256sums_i686=('720c7d380cecd473707bfccee8ef23cd96843dc12631800cfd30a83453467971')
sha256sums_aarch64=('3b8b8510e12274accf9d654e9cdba33a76f0f43ae2083afa9a6eb1804561b0a2')
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
