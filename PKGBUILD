# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.preview76
pkgrel=1
pkgdesc='An advanced subtitle editor and converter (early preview build with Avalonia UI)'
arch=('any')
url='https://github.com/niksedk/subtitleedit-avalonia'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: Video support'
            'tesseract: OCR support')
provides=('subtitleedit')
conflicts=('subtitleedit')
options=('!debug' '!strip')
source=("SubtitleEdit-Linux-x64-${pkgver//.p/-p}.tar.gz::https://github.com/niksedk/subtitleedit-avalonia/releases/download/v${pkgver//.p/-p}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('57ebdc601651c3a1abb3749c039a9e1c1ec46fe0f6be342d3454f8f6c72d1cfeef57ab2dcce448e8324fc0d1981dec8e4a1d79ebd3874fbe6172e08545962264'
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
