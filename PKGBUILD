# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.preview97
pkgrel=1
pkgdesc='An advanced subtitle editor and converter (early preview build with Avalonia UI)'
arch=('any')
url='https://github.com/niksedk/subtitleedit-avalonia'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support')
provides=('subtitleedit')
conflicts=('subtitleedit')
options=('!debug' '!strip')
source=("SubtitleEdit-Linux-x64-${pkgver//.p/-p}.tar.gz::https://github.com/niksedk/subtitleedit-avalonia/releases/download/v${pkgver//.p/-p}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('3d8a4a493702318ea4e02369510a2a6820d5eb5a8a05fbd4160fa05b0c69379709415e4bcd086dc3d261714c7f9168d14d06134072350e1754ef72f2f9588cc4'
        '0e2d96c9611ba8428db13eefb624bbfc4f9e055ce9d56eeac37e275597b073f1222d06760634aef979e3667f1f70e5b0c9400316682ebec8842b02cd3a7df639'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'a3a50848054537f84137a05c721491dd6f7b19a4f115758e127c124d14b3a1d8623f5eee7424fbc9f94ca5a948dd1e2728e01e3dd1ab8d413e0f71dfa46b8f6c')

package() {
    install -Dm755 subtitleedit         "$pkgdir"/usr/bin/subtitleedit

    install -Dm755 SubtitleEdit         "$pkgdir"/opt/subtitleedit/SubtitleEdit
    install -Dm755 libHarfBuzzSharp.so  "$pkgdir"/opt/subtitleedit/libHarfBuzzSharp.so
    install -Dm755 libonigwrap.so       "$pkgdir"/opt/subtitleedit/libonigwrap.so
    install -Dm755 libSkiaSharp.so      "$pkgdir"/opt/subtitleedit/libSkiaSharp.so

    install -Dm644 subtitleedit.desktop "$pkgdir"/usr/share/applications/subtitleedit.desktop
    install -Dm644 subtitleedit.png     "$pkgdir"/usr/share/pixmaps/subtitleedit.png
}
