# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-pwgen
pkgver=1.0
pkgrel=1
pkgdesc="A secure, modern password generator with strength meter"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-pwgen 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-pwgen
  gcc shrike-pwgen.c -o shrike-pwgen $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-pwgen 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-pwgen
  install -Dm755 shrike-pwgen "$pkgdir/usr/bin/shrike-pwgen"
  install -Dm644 shrike-pwgen.desktop "$pkgdir/usr/share/applications/shrike-pwgen.desktop"
  install -Dm644 shrike-pwgen.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shrike-pwgen.svg"
}
