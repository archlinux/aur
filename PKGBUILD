# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrikedrop
pkgver=1.1
pkgrel=3
pkgdesc="Local file transfer - reliable downloads for all file formats"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'glib2' 'qrencode' 'zip' 'libnotify')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrikedrop 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrikedrop
  gcc shrikedrop.c -o shrikedrop $(pkg-config --cflags --libs gtk+-3.0 libnotify) -lqrencode -lpthread
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrikedrop 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrikedrop
  install -Dm755 shrikedrop "$pkgdir/usr/bin/shrikedrop"
  install -Dm644 shrikedrop.desktop "$pkgdir/usr/share/applications/shrikedrop.desktop"
}
