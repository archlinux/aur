pkgname=uzdoom-bin
pkgver=4.14.3rc1
pkgrel=1
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic-bin' 'libvpx')
conflicts=("uzdoom-git")
makedepends=('unzip')
sha256sums_x86_64=('42acb10743bc565b7410977a60d516ce90f2f163fb22849d4b94f5f45c590311')
sha256sums_aarch64=('eac5bc137a59fbd67b57a10c8fb04c69028f5ed18f11e717af631329ab5c797a')
source_x86_64=("uzdoom-$pkgver-x64.tar.xz::https://gitlab.com/linuxbombay/uzdoom/binaries/$pkgver/-/raw/main/uzdoom-x64.tar.xz")
source_aarch64=("uzdoom-$pkgver-arm64.tar.xz::https://gitlab.com/linuxbombay/uzdoom/binaries/$pkgver/-/raw/main/uzdoom-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/uzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/usr" "$pkgdir"
   #Libfix
    [ -e "/usr/lib/libvpx.so.9" ] || ln -s /usr/lib/libvpx.so "$pkgdir/usr/lib/libvpx.so.9"    
}
