# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-dns
pkgver=1.0
pkgrel=1
pkgdesc="A simple tool to switch DNS providers"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'networkmanager' 'polkit')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-dns 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-dns
  gcc shrike-dns.c -o shrike-dns $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-dns 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-dns
  install -Dm755 shrike-dns "$pkgdir/usr/bin/shrike-dns"
  install -Dm644 shrike-dns.desktop "$pkgdir/usr/share/applications/shrike-dns.desktop"
}
