# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-radio
pkgver=1.0
pkgrel=3
pkgdesc="Radio, Local Music/Video Player, Fixed Visualizer + Spacebar Control"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav' 'yt-dlp' 'wget')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-radio 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-radio
  gcc shrike-radio.c -o shrike-radio $(pkg-config --cflags --libs gtk+-3.0 gstreamer-1.0 gstreamer-video-1.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-radio 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-radio
  install -Dm755 shrike-radio "$pkgdir/usr/bin/shrike-radio"
  install -Dm644 shrike-radio.desktop "$pkgdir/usr/share/applications/shrike-radio.desktop"
}
