# Maintainer: RshaCuDeVidro
pkgname=larpercord-bin
pkgver=0.6.4
pkgrel=1
pkgdesc='Native Discord client in Zig, with SDL3 and Dear ImGui'
arch=('x86_64')
url='https://github.com/RshaCuDeVidro/larperCord'
license=('GPL-3.0-only')
depends=('fontconfig' 'freetype2' 'glibc' 'libwebp' 'opus' 'zlib')
optdepends=('ffmpeg: play videos inside the app'
            'noto-fonts-emoji: color emoji'
            'noto-fonts-cjk: Japanese, Korean and Chinese text')
provides=('larpercord')
conflicts=('larpercord')
options=('!strip' '!debug')
source=("larpercord-$pkgver::$url/releases/download/v$pkgver/larpercord-linux-x86_64"
        "larpercord-$pkgver.png::https://raw.githubusercontent.com/RshaCuDeVidro/larperCord/v$pkgver/docs/assets/icon-180.png"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/RshaCuDeVidro/larperCord/v$pkgver/LICENSE"
        'dev.larpercord.desktop')
# Filled in at release time from the published files (updpkgsums).
sha256sums=('3d4de9a3b9fd36bd3354fcb79d6b450acd6d77bcb612ecab3cc57ba2a9ccfcd4'
            '85c76329481345dd68891aab3b05a7a27037e81df87897154fb814f6260a9452'
            'fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0'
            '7052c78361f69d6ff2b837204d3c1fbd255accb36e03dd078947240f05c1c045')

package() {
    install -Dm755 "larpercord-$pkgver" "$pkgdir/usr/bin/larpercord"
    # Taskbars find the icon through the window's app ID, so it also goes under that name.
    install -Dm644 "larpercord-$pkgver.png" "$pkgdir/usr/share/pixmaps/larpercord.png"
    install -Dm644 "larpercord-$pkgver.png" "$pkgdir/usr/share/pixmaps/dev.larpercord.png"
    install -Dm644 dev.larpercord.desktop "$pkgdir/usr/share/applications/dev.larpercord.desktop"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
