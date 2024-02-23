# Maintainer: lisuke <1657787678@qq.com>

pkgname=qt-mpv-bg-wlr
pkgver=0.0.1
pkgrel=1
pkgdesc="A mpv based video wallpaper program for wlroots based wayland compositors. (Video Dynamic Wallpaper for Linux)."
arch=('x86_64')
url="https://github.com/lisuke/$pkgname"
license=('GPL3')
depends=('mpv' 'wlroots' 'qt5-base' 'qt5-wayland' 'layer-shell-qt')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lisuke/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('e06854402751e6cb5733cd6b08a91b68')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
