pkgname=raze-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Build engine port backed by GZDoom tech'
arch=('x86_64' 'aarch64')
url=""
license=('custom:BUILD' 'GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libjpeg' 'libvpx' 'openal' 'sdl2' 'zmusic-bin')
conflicts=("raze" "raze-git")
optdepends=('gxmessage: crash dialog (GNOME)' 'kdialog: crash dialog (KDE)' 'xorg-xmessage: crash dialog (other)')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
sha256sums_x86_64=('SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/raze-bin/binaries/$pkgver/-/raw/main/raze-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/raze-bin/binaries/$pkgver/-/raw/main/raze-linux-arm64.tar.xz")
#source_i386=("https://gitlab.com/raze-bin/binaries/$pkgver/-/raw/main/raze-linux-i686.tar.xz")
#source_i686=("https://gitlab.com/raze-bin/binaries/$pkgver/-/raw/main/raze-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/licenses/raze"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "$pkgdir/usr/share/raze"
    install -dm755 "$pkgdir/usr/share/applications"
    
    #Removing uneeded .files
    rm -rf $srcdir/raze/.*
    cp -r "$srcdir/raze/." "$pkgdir"
}
