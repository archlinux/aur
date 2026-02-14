# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.preview108
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
b2sums=('6fecd7fea17b83d845e3533eabc98e8d97d26d26b88d2cfd6d8649fb23a6f7d229cf4f7ef3c6f007850ba2d4c59d9523f88ee4d80680f66ae56c66a7c70baa0c'
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
