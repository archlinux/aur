pkgname=gzdoom-bin
pkgver=4.11.3
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url=""
license=('custom:BUILD' 'GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic-bin')
conflicts=("gzdoom" "gzdoom-git")
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
sha256sums_x86_64=('SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/gzdoom-bin/binaries/$pkgver/-/raw/main/gzdoom-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/gzdoom-bin/binaries/$pkgver/-/raw/main/gzdoom-linux-arm64.tar.xz")
#source_i386=("https://gitlab.com/gzdoom-bin/binaries/$pkgver/-/raw/main/gzdoom-linux-i686.tar.xz")
#source_i686=("https://gitlab.com/gzdoom-bin/binaries/$pkgver/-/raw/main/gzdoom-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/gzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    #Removing uneeded .files
    rm -rf $srcdir/gzdoom/.*
    cp -r "$srcdir/gzdoom/." "$pkgdir"
    cp "$srcdir/gzdoom/usr/share/applications/gzdoom.desktop" "$pkgdir/usr/share/applications"
}
