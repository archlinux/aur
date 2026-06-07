# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-updater
pkgver=1.1
pkgrel=1
pkgdesc="Graphical package manager for Pacman and Trizen"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'xfce4-terminal' 'sudo' 'pacman')
makedepends=('gcc' 'pkg-config')
optdepends=('trizen: AUR support')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-updater 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-updater
  gcc shrike-updater.c -o shrike-updater $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-updater 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-updater
  install -Dm755 shrike-updater "$pkgdir/usr/bin/shrike-updater"
  install -Dm644 shrike-updater.desktop "$pkgdir/usr/share/applications/shrike-updater.desktop"
}
