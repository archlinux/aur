# Maintainer: Jonas Leder
# Published to the AUR by CI (packaging/ci/aur-publish.sh) after every release; pkgver and the checksums are
# filled in there, the values below are only placeholders.
pkgname=notes-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Self-hosted, end-to-end encrypted note taking (desktop app, prebuilt release binary)'
arch=('x86_64')
url='https://jonasled.dev/jonasled/notes'
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('notes')
conflicts=('notes' 'notes-src')
options=('!strip')
source=("notes-$pkgver::$url/releases/download/v$pkgver/notes-linux-x86_64"
        "LICENSE-$pkgver::$url/raw/tag/v$pkgver/LICENSE"
        "notes-$pkgver.png::$url/raw/tag/v$pkgver/frontend/src-tauri/icons/128x128.png"
        "notes-$pkgver.svg::$url/raw/tag/v$pkgver/frontend/public/icon.svg"
        "notes-$pkgver.desktop::$url/raw/tag/v$pkgver/packaging/aur/notes.desktop")
noextract=("notes-$pkgver")
sha256sums=('e7c8e304a145b04d4ece8be5a3cf54b6bb043fccdcf160980036f3ac28ad2aba'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '548c58e3c6ba6bafca147095ea0b21f62db5867eb81966a48c820b66a6a58a31'
            '3e2a9303f6cd30d52547cba4ed6ccd43a8b6581acd757c3c18a6bf9e55292505'
            '9691991e408d3b4ecffbebb2d36d94cd17498bcd6b3eea616d73762197743c78')

package() {
  install -Dm755 "notes-$pkgver" "$pkgdir/usr/bin/notes"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "notes-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/notes.png"
  install -Dm644 "notes-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notes.svg"
  install -Dm644 "notes-$pkgver.desktop" "$pkgdir/usr/share/applications/notes.desktop"
}
