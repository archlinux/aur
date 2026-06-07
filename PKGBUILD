# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-tether
pkgver=1.1
pkgrel=1
pkgdesc="Assistant to manage Wi-Fi Hotspots and Tethering"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'networkmanager' 'qrencode')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-tether 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-tether
  gcc shrike-tether.c -o shrike-tether $(pkg-config --cflags --libs gtk+-3.0 gdk-pixbuf-2.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-tether 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-tether
  install -Dm755 shrike-tether "$pkgdir/usr/bin/shrike-tether"
  install -Dm644 shrike-tether.desktop "$pkgdir/usr/share/applications/shrike-tether.desktop"
}
