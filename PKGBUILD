pkgname=lazy-store
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4 app store for the Arch repos and AUR, part of LazyOS"
arch=('x86_64')
url="https://github.com/Halespider396/lazy-store"
license=('GPL3')
depends=('gtk4' 'polkit' 'pacman' 'curl' 'tar' 'gzip')
makedepends=('gcc' 'make' 'pkgconf')
optdepends=('swww: wallpaper-based theming' 'hyprpaper: wallpaper-based theming')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('210331cea1d62736e950eba7efacf8f59c313e7c9a7609ef6e88bc316c9c4e06')
options=(!debug)

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
