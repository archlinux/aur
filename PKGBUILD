# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.beta4
pkgrel=1
epoch=1
pkgdesc='An advanced subtitle editor and converter (beta build with Avalonia UI)'
arch=('any')
url='https://github.com/SubtitleEdit/subtitleedit'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support'
            'libvlc: video support')
provides=('subtitleedit')
conflicts=('subtitleedit')
options=('!strip')
source=("SubtitleEdit-Linux-x64-${pkgver}.tar.gz::https://github.com/SubtitleEdit/subtitleedit/releases/download/${pkgver//.b/-b}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('901fb756965d3c48472e159c0c21fc06da6396834e47b824f5b2478286af6b48242633712d607f3982c41f75bd1d2cd1fa9b2bf3b855dae70dd8f0d7138496a9'
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
