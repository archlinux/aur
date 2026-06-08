# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-bluelight
pkgver=1.0
pkgrel=1
pkgdesc="Blue Light Filter with 4 Presets"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'xorg-xrandr')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-bluelight 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-bluelight
  gcc shrike-bluelight.c -o shrike-bluelight $(pkg-config --cflags --libs gtk+-3.0 appindicator3-0.1) -lm
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-bluelight 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-bluelight
  install -Dm755 shrike-bluelight "$pkgdir/usr/bin/shrike-bluelight"
  install -Dm644 shrike-bluelight.desktop "$pkgdir/usr/share/applications/shrike-bluelight.desktop"
}
