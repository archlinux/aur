# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=razergenie
pkgver=1.3.0
pkgrel=1
pkgdesc="Configure and control your Razer devices"
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL-3.0-or-later')
depends=('libopenrazer' 'qt6-base' 'openrazer-daemon')
makedepends=('meson' 'qt6-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('c3b095d83b80387717cfbc02d060d563a0785bb44869fd328f0bcaf278f68e05eb7eeb12c506d3cac6a83a6edd2cdeca0b74669a23140e7ac7c787e5cac75c40'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "RazerGenie-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
