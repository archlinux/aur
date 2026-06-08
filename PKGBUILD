# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-netwatch
pkgver=1.0
pkgrel=1
pkgdesc="Professional Network Monitor with Accurate Graphs and Scales"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-netwatch 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-netwatch
  gcc shrike-netwatch.c -o shrike-netwatch $(pkg-config --cflags --libs gtk+-3.0) -lm
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-netwatch 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-netwatch
  install -Dm755 shrike-netwatch "$pkgdir/usr/bin/shrike-netwatch"
  install -Dm644 shrike-netwatch.desktop "$pkgdir/usr/share/applications/shrike-netwatch.desktop"
  install -Dm644 shrike-netwatch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shrike-netwatch.svg"
}
