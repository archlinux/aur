# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-media-converter
pkgver=1.2
pkgrel=1
pkgdesc="Universal Media Converter with Web Optimized MP4"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'ffmpeg')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-media-converter 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-media-converter
  gcc shrike-media-converter.c -o shrike-media-converter $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-media-converter 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-media-converter
  install -Dm755 shrike-media-converter "$pkgdir/usr/bin/shrike-media-converter"
  install -Dm644 shrike-media-converter.desktop "$pkgdir/usr/share/applications/shrike-media-converter.desktop"
}
