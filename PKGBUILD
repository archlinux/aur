# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=qwlroots
pkgver=0.1.0
pkgrel=1
pkgdesc='Qt and QML bindings for wlroots.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/qwlroots"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'wlroots' 'ninja' 'wayland-protocols' 'wlr-protocols-git')
source=("https://github.com/vioken/qwlroots/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  cmake -B . \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXEC=libexec
  cmake --build .
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
