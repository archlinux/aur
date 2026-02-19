# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.preview110
pkgrel=1
pkgdesc='An advanced subtitle editor and converter (preview build with Avalonia UI)'
arch=('any')
url='https://github.com/niksedk/subtitleedit-avalonia'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support'
            'libvlc: video support')
provides=('subtitleedit')
conflicts=('subtitleedit')
options=('!strip')
source=("SubtitleEdit-Linux-x64-${pkgver//.p/-p}.tar.gz::https://github.com/niksedk/subtitleedit-avalonia/releases/download/v${pkgver//.p/-p}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('9929cade8ea44adfef2c6325f0a80b7c9f272ddd35461b54340f3ae58a67feba60e57ae3d4abfe802afa73300dc0e872a3c82ec8712aab9ccf7931e7730325d2'
        '0e2d96c9611ba8428db13eefb624bbfc4f9e055ce9d56eeac37e275597b073f1222d06760634aef979e3667f1f70e5b0c9400316682ebec8842b02cd3a7df639'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'eefd5090791d860aa17f209ccf1d277b6e394af12bce07ecdebae5782b53cd9721c6d53e8034c038c0bdce5ffd09ba0c954aa90aa9cd9fbcffc1558d1010dc26')

package() {
    install -Dm755 subtitleedit         "${pkgdir}"/usr/bin/subtitleedit

    install -Dm755 SubtitleEdit         "${pkgdir}"/opt/subtitleedit/SubtitleEdit
    install -Dm755 libHarfBuzzSharp.so  "${pkgdir}"/opt/subtitleedit/libHarfBuzzSharp.so
    install -Dm755 libonigwrap.so       "${pkgdir}"/opt/subtitleedit/libonigwrap.so
    install -Dm755 libSkiaSharp.so      "${pkgdir}"/opt/subtitleedit/libSkiaSharp.so

    install -Dm644 subtitleedit.desktop "${pkgdir}"/usr/share/applications/subtitleedit.desktop
    install -Dm644 subtitleedit.png     "${pkgdir}"/usr/share/pixmaps/subtitleedit.png
}
