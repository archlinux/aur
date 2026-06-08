# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrikeusb-gui
pkgver=1.2
pkgrel=1
pkgdesc="Graphical USB ISO Burner with Real-Time Statistics"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'polkit' 'udisks2')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-usbmaker-gui 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-usbmaker-gui
  gcc shrikeusb-gui.c -o shrikeusb-gui $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-usbmaker-gui 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-usbmaker-gui
  install -Dm755 shrikeusb-gui "$pkgdir/usr/bin/shrikeusb-gui"
  install -Dm644 shrikeusb-gui.desktop "$pkgdir/usr/share/applications/shrikeusb-gui.desktop"
}
