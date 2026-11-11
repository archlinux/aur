# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=infopanel-bin
pkgver=0.4.0
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
sha256sums=('96da43850b006a09997ed3cfd3d372921579c2464002be60b0e94b7ad218d44f'
            'a80ca27db456161f76f9b3198d0561fa3d327d05b3c57afd4222a64737dbcc8d')

package() {
  bash "$srcdir/stage-package.sh" "$srcdir/infopanel-$pkgver-linux-x64" \
    "$pkgdir" "usr/share/licenses/$pkgname"
}
