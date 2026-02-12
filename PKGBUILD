# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=spotiflac-bin
pkgver=7.0.9
pkgrel=1
pkgdesc="Get Spotify tracks in true FLAC from Tidal, Qobuz & Amazon Music"
arch=('x86_64')
url="https://github.com/afkarxyz/SpotiFLAC"
license=('LicenseRef-unknown')
depends=('webkit2gtk-4.1')
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://github.com/afkarxyz/SpotiFLAC/releases/download/v$pkgver/SpotiFLAC.AppImage")
sha256sums=('d885b4f37fa6b69404051d517ffeaa834d93b729b7d45df4d73b81ba4b2c2cff')

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/SpotiFLAC "$pkgdir/usr/bin/SpotiFLAC"
    install -Dm644 squashfs-root/spotiflac.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/spotiflac.png"
    install -Dm644 squashfs-root/spotiflac.desktop "$pkgdir/usr/share/applications/spotiflac.desktop"
}
