# Maintainer: karras <karras@0x539.ch>
pkgname=wayland-logout
pkgver=1.4
pkgrel=1
pkgdesc="A utility designed to kill a single instance of a Wayland compositor"
arch=('x86_64')
url="https://github.com/soreau/wayland-logout"
license=('MIT')
makedepends=('meson' 'ninja')
source=("https://github.com/soreau/wayland-logout/archive/v${pkgver}.tar.gz")
sha512sums=('376f39283851478723e3d846055ad76b6ae8b887b487cd98ebcdf87b1d95c3b5de5cad07f2d8921740c4e4102ce988833a9b7ebe662e51654316de9f85daabcf')

build() {
  cd "$pkgname-$pkgver"

  meson build
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/wayland-logout "$pkgdir/usr/bin/wayland-logout"
  install -Dm644 wayland-logout.1 "$pkgdir/usr/share/man/man1/wayland-logout.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
