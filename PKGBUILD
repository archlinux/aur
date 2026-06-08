# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-ytdown
pkgver=1.2
pkgrel=1
pkgdesc="GTK3 YouTube Channel Video, Audio (MP3) & Thumbnail Downloader"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'yt-dlp' 'ffmpeg')
makedepends=('gcc' 'pkg-config')
optdepends=('python-mutagen: embed thumbnails in MP3 files' 'xdg-utils: open output folder in file manager')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-ytdown 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-ytdown
  gcc shrike-ytdown.c -o shrike-ytdown $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-ytdown 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-ytdown
  install -Dm755 shrike-ytdown "$pkgdir/usr/bin/shrike-ytdown"
  install -Dm644 shrike-ytdown.desktop "$pkgdir/usr/share/applications/shrike-ytdown.desktop"
}
