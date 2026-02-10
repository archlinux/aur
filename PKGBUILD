# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=spotiflac-bin
pkgver=7.0.8
pkgrel=1
pkgdesc="Get Spotify tracks in true FLAC from Tidal, Qobuz & Amazon Music"
arch=('x86_64')
url="https://github.com/afkarxyz/SpotiFLAC"
license=('LicenseRef-unknown')
depends=('webkit2gtk-4.1')
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://github.com/afkarxyz/SpotiFLAC/releases/download/v$pkgver/SpotiFLAC.AppImage")
sha256sums=('7479414fe5b8b7bbc4e2c8209361b4a4da2528d99876a290bc45a31f5baebab1')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/SpotiFLAC "$pkgdir/usr/bin/SpotiFLAC"
    install -Dm644 squashfs-root/spotiflac.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/spotiflac.png"
    install -Dm644 squashfs-root/spotiflac.desktop "$pkgdir/usr/share/applications/spotiflac.desktop"
}
