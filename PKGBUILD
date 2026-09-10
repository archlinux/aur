# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=5.2.0
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
b2sums_x86_64=('958e5dc19c07f374740ad435eda83614d677592c042d694efe5f6a90478e3b079975e154434de53a410465f88e468df6800568be4865d494d67d883b35285fb7')
b2sums_aarch64=('933862c89e54f4a8fb02f148be4f99987d9ae244ceedc38ce566ad8e11f3068f5dc49564e200fc9083bb6db9891a6a900687399d53f988cd2160bd20b0f080d0')

package() {
    install -Dm755 SubtitleEdit "${pkgdir}"/usr/bin/subtitleedit

    install -Dm755 -t "${pkgdir}"/usr/lib libHarfBuzzSharp.so libSkiaSharp.so

    install -Dm644 -t "${pkgdir}"/usr/share/applications subtitleedit.desktop
    install -Dm644 -t "${pkgdir}"/usr/share/pixmaps subtitleedit.png

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/subtitleedit LICENSE
}
