# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=spotiflac-bin
pkgver=7.2.0
pkgrel=1
pkgdesc="Get Spotify tracks in true FLAC from Tidal, Qobuz & Amazon Music"
arch=('x86_64')
url="https://github.com/spotbye/SpotiFLAC"
license=('LicenseRef-unknown')
depends=('webkit2gtk-4.1')
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://github.com/afkarxyz/SpotiFLAC/releases/download/v$pkgver/SpotiFLAC.AppImage")
sha256sums=('be07d0189336fc9bb0b20d9d7256440b961035a82c822581694e538c955a8d98')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/SpotiFLAC "$pkgdir/usr/bin/SpotiFLAC"
    install -Dm644 squashfs-root/spotiflac.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/spotiflac.png"
    install -Dm644 squashfs-root/spotiflac.desktop "$pkgdir/usr/share/applications/spotiflac.desktop"
}
