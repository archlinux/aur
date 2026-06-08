# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-qrgen
pkgver=2.0
pkgrel=1
pkgdesc="Modern system-themed QR Code generator"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'qrencode')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-qrgen 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-qrgen
  gcc shrike-qrgen.c -o shrike-qrgen $(pkg-config --cflags --libs gtk+-3.0 gdk-pixbuf-2.0 libqrencode)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-qrgen 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-qrgen
  install -Dm755 shrike-qrgen "$pkgdir/usr/bin/shrike-qrgen"
  install -Dm644 shrike-qrgen.desktop "$pkgdir/usr/share/applications/shrike-qrgen.desktop"
  install -Dm644 shrike-qrgen.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shrike-qrgen.svg"
}
