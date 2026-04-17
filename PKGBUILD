# Maintainer: Víctor Pont <victor at pont dot cat>
pkgname=spotiflac-bin
pkgver=7.1.4
pkgrel=2
pkgdesc="Get Spotify tracks in true FLAC from Tidal, Qobuz & Amazon Music"
arch=('x86_64')
url="https://github.com/spotbye/SpotiFLAC"
license=('LicenseRef-unknown')
depends=('webkit2gtk-4.1')
options=('!strip')
source=("spotiflac-linux-bundle-$pkgver.tar.gz::https://github.com/spotbye/SpotiFLAC/releases/download/v$pkgver/spotiflac-linux-bundle.tar.gz")
sha256sums=('e4bfa8913045e2727eeb43bacbc62b3de4aba5c34dde0c6314f54a744c91f105')

prepare() {
    chmod +x SpotiFLAC-linux-bundle/SpotiFLAC-amd64.AppImage
    ./SpotiFLAC-linux-bundle/SpotiFLAC-amd64.AppImage --appimage-extract
}

package() {
    install -Dm755 squashfs-root/usr/bin/SpotiFLAC "$pkgdir/usr/bin/SpotiFLAC"
    install -Dm644 squashfs-root/spotiflac.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/spotiflac.png"
    install -Dm644 squashfs-root/spotiflac.desktop "$pkgdir/usr/share/applications/spotiflac.desktop"
}
