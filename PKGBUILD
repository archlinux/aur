# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=5.0.0
pkgrel=1
pkgdesc='An advanced subtitle editor and converter'
arch=('any')
url='https://www.nikse.dk/subtitleedit'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support'
            'libvlc: video support')
conflicts=('libHarfBuzzSharp.so'
           'libonigwrap.so'
           'libSkiaSharp.so')
options=('!strip')
source=("SubtitleEdit-Linux-x64-${pkgver}.tar.gz::https://github.com/SubtitleEdit/subtitleedit/releases/download/v${pkgver}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('b33032c9c1554e26509bfa60fe6541c03aecda87cf38d295b81f3e438f9595c3c054f04bb2e2db27bcf2d30a80fab7e962bf93d37ba7c65f791c75109b14ddcd'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'eefd5090791d860aa17f209ccf1d277b6e394af12bce07ecdebae5782b53cd9721c6d53e8034c038c0bdce5ffd09ba0c954aa90aa9cd9fbcffc1558d1010dc26')

package() {
    install -Dm755 SubtitleEdit "${pkgdir}"/usr/bin/subtitleedit

    install -Dm755 -t "${pkgdir}"/usr/lib libHarfBuzzSharp.so libonigwrap.so libSkiaSharp.so

    install -Dm644 -t "${pkgdir}"/usr/share/applications subtitleedit.desktop
    install -Dm644 -t "${pkgdir}"/usr/share/pixmaps subtitleedit.png

    install -Dm644 -t "${pkgdir}"/usr/share/licenses/subtitleedit LICENSE
}
