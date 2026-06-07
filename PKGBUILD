# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-trimmer
pkgver=3.0
pkgrel=1
pkgdesc="Video Trimmer"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'gst-plugin-gtk')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-trimmer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-trimmer
  gcc shrike-trimmer.c -o shrike-trimmer $(pkg-config --cflags --libs gtk+-3.0 gstreamer-1.0 gstreamer-video-1.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-trimmer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-trimmer
  install -Dm755 shrike-trimmer "$pkgdir/usr/bin/shrike-trimmer"
  install -Dm644 shrike-trimmer.desktop "$pkgdir/usr/share/applications/shrike-trimmer.desktop"
}
