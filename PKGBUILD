# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-walkman
pkgver=1.5
pkgrel=1
pkgdesc="Retro Walkman/Boombox with shuffle, recording, internet radio with search, custom stations"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
optdepends=('ttf-iosevka: Crisp monospace button icons' 'pulseaudio: System audio recording')
makedepends=('gcc' 'pkgconf')

source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-walkman 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-walkman
  gcc shrike-walkman.c -o shrike-walkman $(pkg-config --cflags --libs gtk+-3.0 gstreamer-1.0) -lm
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-walkman 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-walkman
  install -Dm755 shrike-walkman "$pkgdir/usr/bin/shrike-walkman"
  install -Dm644 shrike-walkman.desktop "$pkgdir/usr/share/applications/shrike-walkman.desktop"
}
