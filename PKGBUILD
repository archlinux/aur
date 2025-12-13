# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-avalonia
pkgver=5.0.0.preview74
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
b2sums=('ef0671dca0b0f9407d3ae9dcc529323379cb77efa96f65eeff0a91e14f9ebf7aeab9f3c4f48d0c8bb2fae6b822ec144d046450d5237ce3aa31b464e1d4a738ab'
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
