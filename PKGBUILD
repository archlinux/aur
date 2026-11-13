# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=infopanel-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Hardware monitoring dashboards for desktop overlays, USB LCD panels and web browsers"
arch=('x86_64')
url="https://github.com/emaspa/InfoPanel-linux"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'fontconfig' 'libx11' 'libice' 'libsm' 'libxcursor' 'libxext' 'libxi' 'libxrandr' 'libjpeg-turbo')
optdepends=('ffmpeg: video and RTSP display items'
            'smartmontools: SMART drive health sensors'
            'pipewire-pulse: audio spectrum plugin (or pulseaudio)')
provides=('infopanel')
conflicts=('infopanel')
install=infopanel-bin.install
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/infopanel-$pkgver-linux-x64.tar.gz"
        'stage-package.sh')
sha256sums=('4e851debcc0a96fcf0a25f1719388efc7d62924daadc36a130bf93d34fa816e6'
            'a80ca27db456161f76f9b3198d0561fa3d327d05b3c57afd4222a64737dbcc8d')

package() {
  bash "$srcdir/stage-package.sh" "$srcdir/infopanel-$pkgver-linux-x64" \
    "$pkgdir" "usr/share/licenses/$pkgname"
}
