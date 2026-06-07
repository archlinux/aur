# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-service-manager
pkgver=1.1
pkgrel=1
pkgdesc="A simple GTK3 GUI to manage systemd services"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'polkit' 'systemd')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-service-manager 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-service-manager
  gcc shrike-service-manager.c -o shrike-service-manager $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-service-manager 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-service-manager
  install -Dm755 shrike-service-manager "$pkgdir/usr/bin/shrike-service-manager"
  install -Dm644 shrike-service-manager.desktop "$pkgdir/usr/share/applications/shrike-service-manager.desktop"
}
