# Maintainer: lisuke <1657787678@qq.com>

pkgname=qt-mpv-bg-wlr
pkgver=0.0.3
pkgrel=3
pkgdesc="A mpv based video wallpaper program for wlroots based wayland compositors. (Video Dynamic Wallpaper for Linux)."
arch=('x86_64')
url="https://github.com/lisuke/$pkgname"
license=('GPL3')
depends=('mpv' 'wayland' 'qt6-base' 'qt6-wayland' 'layer-shell-qt')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lisuke/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('0227aa1d9122c73a4b18a1ca1364d7dd')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
