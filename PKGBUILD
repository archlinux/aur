# Maintainer: tinyopsec <anon@proton.me>

pkgname=swm
pkgver=0.2
pkgrel=1
pkgdesc="Simple Window Manager - minimalistic X11 tiling window manager"
arch=('x86_64')
url="https://github.com/tinyopsec/swm"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-main"
  make
}

package() {
  cd "$pkgname-main"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
