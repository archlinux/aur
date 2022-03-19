# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=wio-wl
pkgver=0.15.1
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo wlroots)
options=(strip)
makedepends=(meson)
source=("https://gitlab.com/Rubo/wio/-/archive/$pkgver/wio-$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
  cd wio-$pkgver
  arch-meson build
  meson compile -C build
}

package() {
  cd wio-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  meson install -C build --destdir "$pkgdir"
}
