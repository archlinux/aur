pkgname=raze-bin
pkgver=1.10.2
pkgrel=1
pkgdesc='Build engine port backed by GZDoom tech'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/raze"
license=('custom:BUILD' 'GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libjpeg' 'libvpx' 'openal' 'sdl2' 'zmusic')
conflicts=("raze" "raze-git" "zmusic-bin")
optdepends=('gxmessage: crash dialog (GNOME)' 'kdialog: crash dialog (KDE)' 'xorg-xmessage: crash dialog (other)')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('c7f8463eb44747b12bfc1adc1a4c5f3705e80cc0b3dc3fe46cdcd4fb12c9b639')
sha256sums_aarch64=('c20a90f1b2d294954ceb2b134de5ab7c050434c6002bcedf62e023d0c3fc0c32')
source_x86_64=("https://gitlab.com/linuxbombay/raze/binaries/$pkgver/-/raw/main/raze-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/raze/binaries/$pkgver/-/raw/main/raze-linux-arm64.tar.xz")

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
