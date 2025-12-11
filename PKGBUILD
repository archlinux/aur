pkgname=xash3d-fwgs-bin
pkgver=146244f
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('aa5af676f1b72816fcb3e88248a01b0f19bcde80d1b42b6ef2b1b39efcb34f4f')
sha256sums_aarch64=('5ce71d626bd8769dd1069d8a6f56f78ddcbd52a044a492dcca690e4c1803e8c3')
source_x86_64=("xash3d-$pkgver-linux-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-amd64.tar.gz")
source_aarch64=("xash3d-$pkgver-linux-arm64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-arm64.tar.gz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/*.so "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -n "$srcdir"/*.so.* "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir/valve" "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir/xash3d" "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
