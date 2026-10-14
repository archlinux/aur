# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=5.3.0
pkgrel=1
pkgdesc='An advanced subtitle editor and converter'
arch=('x86_64' 'aarch64')
url='https://www.nikse.dk/subtitleedit'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
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
b2sums_x86_64=('088230f6ea159f61c67a08330f90bb1b8f48ed74be7edad357c91ab15e22d734a9527e411c27f5050fbaf522a44ff21abb7e963e70068f0bc508ba76ca681b26')
b2sums_aarch64=('f3c4007c4a0536584f43ac6934714c135c277baa7a2101f65017089921b9b688efc29488015d27bbc30835b080d44fa66c5f785c842b857098c3ddf0a0c0d729')

package() {
    install -Dm755 SubtitleEdit "${pkgdir}"/usr/bin/subtitleedit

    install -Dm755 -t "${pkgdir}"/usr/lib libHarfBuzzSharp.so libSkiaSharp.so

    install -Dm644 -t "${pkgdir}"/usr/share/applications subtitleedit.desktop
    install -Dm644 -t "${pkgdir}"/usr/share/pixmaps subtitleedit.png

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/subtitleedit LICENSE
}
