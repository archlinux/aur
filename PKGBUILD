# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=mxfceg-menu
pkgver=1.0
pkgrel=1
pkgdesc="Fullscreen launcher with Config support and Smart Blur"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'glib2')
makedepends=('gcc' 'pkg-config')

# Download the main branch directly from Codeberg
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  # Find the folder (Codeberg names it after the repo, try both cases)
  cd "$srcdir"/Shrike-Linux-Uganda/mxfceg-menu 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/mxfceg-menu
  gcc mxfceg-menu.c -o mxfceg-menu $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/mxfceg-menu 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/mxfceg-menu
  install -Dm755 mxfceg-menu "$pkgdir/usr/bin/mxfceg-menu"
  install -Dm644 mxfceg-menu.desktop "$pkgdir/usr/share/applications/mxfceg-menu.desktop"
}
