# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=spotiflac-bin
pkgver=7.0
pkgrel=1
pkgdesc="Get Spotify tracks in true FLAC from Tidal, Qobuz & Amazon Music — no account required."
arch=('x86_64')
url="https://github.com/afkarxyz/SpotiFLAC"
license=('unknown')
depends=('webkit2gtk-4.1')
options=('!debug' '!strip')
source=("$pkgname-$pkgver.AppImage::https://github.com/afkarxyz/SpotiFLAC/releases/download/v$pkgver/SpotiFLAC.AppImage"
        "icon.svg::https://raw.githubusercontent.com/afkarxyz/SpotiFLAC/main/frontend/public/icon.svg"
        "spotiflac.desktop")
noextract=("$pkgname-$pkgver.AppImage")
sha256sums=('a466b8ed8875f6b450ad44664ed120f28082b6fa596a5f1072aafa4617a7e8d2'
            'add21ab3055c27b208850811efc096a1bb1d1804fb74c9e2e0b4076ffbf54562'
            'cccb9aeec382cceaba8dadfa6e95f0c54b2601c2e8c4589f877a24035d9d3515')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/spotiflac"
    install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/pixmaps/spotiflac.svg"
    install -Dm644 "$srcdir/spotiflac.desktop" "$pkgdir/usr/share/applications/spotiflac.desktop"
}
