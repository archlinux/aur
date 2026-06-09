pkgname=xash3d-fwgs-bin
pkgver=abd7b5c
pkgrel=1
pkgdesc="Xash3D FWGS is a heavily modified fork of an original Xash3D Engine for Half Life 1"
arch=('x86_64' 'i686' 'aarch64' 'arm7l')
url="https://gitlab.com/linuxbombay/xash3d-fwgs"
license=('GPL')
depends=('sdl2' 'sdl2_net')
makedepends=('unzip')
sha256sums_x86_64=('c37102414df60b89f4c64c6e0f42c657cfa0884bc5529c97e0d591f36cc62c4b')
sha256sums_i686=('6f9aca6f3b0feb2330d11f99a183ae87f909d04a5209f83d6dbcbd8195c07443')
sha256sums_aarch64=('86ce18248d22905dc87ab0d10d63c56c2c1709e543d29b93bc196e9478fbdaaf')
sha256sums_arm7l=('54b8f50f976229f25381a8634559e19ed6433bcf3aaa0d9e75fd03233eb6aa8f')
source_x86_64=("xash3d-$pkgver-linux-x64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-amd64.tar.gz")
source_i686=("xash3d-$pkgver-linux-i686.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-i386.tar.gz")
source_aarch64=("xash3d-$pkgver-linux-arm64.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-arm64.tar.gz")
source_arm7l=("xash3d-$pkgver-linux-arm7l.tar.xz::$url/$pkgver/-/raw/main/xash3d-fwgs-linux-armhf.tar.gz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/xash3d-fwgs"
    
    cp -n "$srcdir"/xash3d-fwgs-linux-*/*.so "$srcdir"/xash3d-fwgs-linux-*/*.so.* "$pkgdir/usr/share/games/xash3d-fwgs"
    cp -r "$srcdir"/xash3d-fwgs-linux-*/valve "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir"/xash3d-fwgs-linux-*/xash3d "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir"/xash3d-fwgs-linux-*/xash "$pkgdir/usr/share/games/xash3d-fwgs"
    install -Dm755 "$srcdir"/xash3d-fwgs-linux-*/mdldec "$pkgdir/usr/share/games/xash3d-fwgs"
    ln -sf "/usr/share/games/xash3d-fwgs/xash3d" "$pkgdir/usr/bin"
}
