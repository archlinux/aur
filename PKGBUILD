# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=5.0.0rc1
pkgrel=1
pkgdesc='An advanced subtitle editor and converter'
arch=('any')
url='https://www.nikse.dk/subtitleedit'
license=('MIT')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support'
            'libvlc: video support')
options=('!strip')
source=("SubtitleEdit-Linux-x64-${pkgver}.tar.gz::https://github.com/SubtitleEdit/subtitleedit/releases/download/v${pkgver//rc/-rc}/SubtitleEdit-Linux-x64.tar.gz"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('53b167a8c4e0a4a779f495655a974394389775c7f29b5d59c0a466f4c773fc9f12dd1e8b3122d14c29cf0302d885a760ce6b005990563d903d391b17a69db32d'
        '0e2d96c9611ba8428db13eefb624bbfc4f9e055ce9d56eeac37e275597b073f1222d06760634aef979e3667f1f70e5b0c9400316682ebec8842b02cd3a7df639'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'eefd5090791d860aa17f209ccf1d277b6e394af12bce07ecdebae5782b53cd9721c6d53e8034c038c0bdce5ffd09ba0c954aa90aa9cd9fbcffc1558d1010dc26')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" subtitleedit

    install -Dm755 -t "${pkgdir}/opt/subtitleedit" SubtitleEdit libHarfBuzzSharp.so libonigwrap.so libSkiaSharp.so

    install -Dm644 -t "${pkgdir}/usr/share/applications" subtitleedit.desktop
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" subtitleedit.png

    install -Dm644 "${startdir}"/LICENSES/MIT.txt "${pkgdir}"/usr/share/licenses/subtitleedit/LICENSE
}
