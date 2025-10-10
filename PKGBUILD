pkgname=gzdoom-bin
pkgver=4.14.2
pkgrel=5
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic-bin' 'libvpx')
conflicts=("gzdoom" "gzdoom-git")
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('5c289509351f836a44ce1f3ffa8fa831c8701a3fe511e442397323c7df93d979')
sha256sums_aarch64=('02247a783795054d45d76698e0a4c530eb9798382f42ffbb2c8301e42e03be77')
source_x86_64=("gzdoom-$pkgver-x64.tar.xz::https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-x64.tar.xz")
source_aarch64=("gzdoom-$pkgver-arm64.tar.xz::https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/gzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/usr" "$pkgdir"
   #Libfix
    [ -e "/usr/lib/libvpx.so.9" ] || ln -s /usr/lib/libvpx.so "$pkgdir/usr/lib/libvpx.so.9"
}
