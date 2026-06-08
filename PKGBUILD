# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-resizer
pkgver=1.0
pkgrel=1
pkgdesc="A simple GTK3 batch image resizer"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'imagemagick')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-resizer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-resizer
  gcc shrike-resizer.c -o shrike-resizer $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-resizer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-resizer
  install -Dm755 shrike-resizer "$pkgdir/usr/bin/shrike-resizer"
  install -Dm644 shrike-resizer.desktop "$pkgdir/usr/share/applications/shrike-resizer.desktop"
}
