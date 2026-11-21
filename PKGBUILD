# Maintainer: novesce
pkgname=line-linux-bin
pkgver=0.1.git35.8695817
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
_deb='line-linux_0.1+git35.8695817_amd64.deb'
source=("$_deb::https://github.com/novesce/line-linux-packaging/releases/download/line-86958170a61cadf8bda0d4edfb8b784e9954e0da/$_deb")
sha256sums=('24e764da2bb7361c7d1198400b3096b3acfc40a4cb1ad8102a4773a191ffa4d2')
noextract=("$_deb")
options=('!strip')

package() {
    bsdtar -xOf "$srcdir/$_deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"
}
