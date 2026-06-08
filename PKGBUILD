# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrikedisc-gui
pkgver=1.0
pkgrel=2
pkgdesc="A simple GTK3 optical disc burner (CD/DVD/BD)"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'polkit' 'cdrkit' 'dvd+rw-tools')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrikedisc-gui 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrikedisc-gui
  gcc shrikedisc-gui.c -o shrikedisc-gui $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrikedisc-gui 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrikedisc-gui
  install -Dm755 shrikedisc-gui "$pkgdir/usr/bin/shrikedisc-gui"
  install -Dm644 shrikedisc-gui.desktop "$pkgdir/usr/share/applications/shrikedisc-gui.desktop"
}
