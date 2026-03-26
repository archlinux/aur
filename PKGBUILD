# Maintainer: tinyopsec <anon@proton.me>

pkgname=nwm
pkgver=0.1
pkgrel=1
pkgdesc="Nano Window Manager - minimalistic X11 tiling window manager"
arch=('x86_64')
url="https://github.com/tinyopsec/nwm"
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
