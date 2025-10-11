pkgname=raze-bin
pkgver=1.11.0.f5ce6d9
pkgrel=1
pkgdesc='Build engine port backed by GZDoom tech'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/raze"
license=('custom:BUILD' 'GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libjpeg' 'libvpx' 'openal' 'sdl2' 'zmusic-bin')
conflicts=("raze" "raze-git")
optdepends=('gxmessage: crash dialog (GNOME)' 'kdialog: crash dialog (KDE)' 'xorg-xmessage: crash dialog (other)')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('c2123b502aa6bdc8e59bd5a10da3e7108a9bfcfe71cd350b1fb76a9a9873a0be')
sha256sums_aarch64=('556d4abd1868fa905d05673ca8a7c5cc50bcfe69b07474ef6047c10bffccb19d')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/raze-$pkgver-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/raze-$pkgver-linux-arm64.tar.xz")

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
