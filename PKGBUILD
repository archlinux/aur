pkgname=gzdoom-bin
pkgver=4.12.2
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic')
conflicts=("gzdoom" "gzdoom-git" "zmusic-bin")
provides=('zmusic')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('89f05685395b53e90bfe31f526a8de1fdd2fe42b7379cdb43eb9410d711c4422')
sha256sums_aarch64=('1f7c4703bc3e324cfb245f3da539349bc058ec307630979514f116649bd82941')
source_x86_64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-linux-arm64.tar.xz")

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
