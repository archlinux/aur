# Maintainer: novesce
pkgname=line-linux-bin
pkgver=0.1.git33.76bba8a
pkgrel=1
pkgdesc='Unofficial native LINE desktop client, repackaged from the Ubuntu DEB'
arch=('x86_64')
url='https://github.com/novesce/line-linux'
license=('GPL-3.0-or-later')
depends=('glibc' 'sdl2-compat' 'cairo' 'pango' 'glib2' 'qrencode'
         'curl' 'openssl-3' 'libjpeg-turbo' 'libpng' 'libwebp'
         'opus' 'libsrtp' 'libpipewire' 'zlib' 'webkitgtk-6.0')
optdepends=('ffmpeg: video playback and recording'
            'xdg-desktop-portal: screenshots and screen sharing'
            'zbar: scanning QR images' )
provides=('line-linux')
conflicts=('line-linux' 'line-linux-git')
_deb='line-linux_0.1+git33.76bba8a_amd64.deb'
source=("$_deb::https://github.com/novesce/line-linux-packaging/releases/download/line-76bba8a35dbd96ff98e74230da3ce88da6fea285/$_deb")
sha256sums=('258b1448a2dbdec83c90920c64a870fa3f1de7af7f996b843355549b49347c31')
noextract=("$_deb")
options=('!strip')

package() {
    bsdtar -xOf "$srcdir/$_deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"
}
