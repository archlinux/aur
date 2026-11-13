# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=infopanel-bin
pkgver=0.4.4
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
sha256sums=('76dcc5ae42cb00f7e1c2a7e3a88af4fd5020ae1a99001034713dada5253207f9'
            'a80ca27db456161f76f9b3198d0561fa3d327d05b3c57afd4222a64737dbcc8d')

package() {
  bash "$srcdir/stage-package.sh" "$srcdir/infopanel-$pkgver-linux-x64" \
    "$pkgdir" "usr/share/licenses/$pkgname"
}
