# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrikeusb-cli
pkgver=1.0
pkgrel=2
pkgdesc="Terminal-based USB ISO Burner for Shrike Linux"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('glibc' 'sudo')
makedepends=('gcc')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-usbmaker 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-usbmaker
  gcc shrike-usbmaker.c -o shrike-usbmaker
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-usbmaker 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-usbmaker
  install -Dm755 shrike-usbmaker "$pkgdir/usr/bin/shrike-usbmaker"
  install -Dm644 shrike-usbmaker.desktop "$pkgdir/usr/share/applications/shrike-usbmaker.desktop"
}
