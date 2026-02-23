pkgname=tuipaper
pkgver=0.1.0
pkgrel=1
pkgdesc='TUI wallpaper manager and setter for Wayland'
arch=('x86_64')
url='https://github.com/aethstetic/tuipaper'
license=('MIT')
depends=('wayland')
makedepends=('gcc' 'wayland-protocols' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 tuipaper "$pkgdir/usr/bin/tuipaper"
  install -Dm755 tuipaper-bg "$pkgdir/usr/bin/tuipaper-bg"
}
