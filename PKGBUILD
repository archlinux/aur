# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=5.4.0
pkgrel=1
pkgdesc='An advanced subtitle editor and converter'
arch=('x86_64' 'aarch64')
url='https://www.nikse.dk/subtitleedit'
license=('MIT')
optdepends=('ffmpeg: video support & waveform extraction'
            'mpv: video support'
            'libvlc: video support')
conflicts=('libHarfBuzzSharp.so'
           'libSkiaSharp.so')
options=('!strip')
source=('subtitleedit.desktop'
        'subtitleedit.png')
source_x86_64=("SubtitleEdit-Linux-x64-${pkgver}.tar.gz::https://github.com/SubtitleEdit/subtitleedit/releases/download/v${pkgver}/SubtitleEdit-Linux-x64.tar.gz")
source_aarch64=("SubtitleEdit-Linux-ARM64-${pkgver}.tar.gz::https://github.com/SubtitleEdit/subtitleedit/releases/download/v${pkgver}/SubtitleEdit-Linux-ARM64.tar.gz")
b2sums=('bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'eefd5090791d860aa17f209ccf1d277b6e394af12bce07ecdebae5782b53cd9721c6d53e8034c038c0bdce5ffd09ba0c954aa90aa9cd9fbcffc1558d1010dc26')
b2sums_x86_64=('5acd9270feba7bcd2c36d8b11985b9af18240a5049fd4e3e4aa123ee076c724cbe9494582ad9497f07c7f531f676b830ba5102f39466cd38911b7f998b2e2a44')
b2sums_aarch64=('7a9f0bff09ec9fdbe7fbd350bf6ac7302904f66ce9996258ee9b55c9d45cd8b71aac2f2f4122cf5c9d88ad34ca2f5b2ab3284e121bfefb552f3cdc010ead066d')

package() {
    install -Dm755 SubtitleEdit "${pkgdir}"/usr/bin/subtitleedit

    install -Dm755 -t "${pkgdir}"/usr/lib libHarfBuzzSharp.so libSkiaSharp.so

    install -Dm644 -t "${pkgdir}"/usr/share/applications subtitleedit.desktop
    install -Dm644 -t "${pkgdir}"/usr/share/pixmaps subtitleedit.png

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/subtitleedit LICENSE
}
