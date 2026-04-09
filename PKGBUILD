# Maintainer: tinyopsec <anon@proton.me>

pkgname=tmenu
pkgver=0.1
pkgrel=1
pkgdesc="Minimal X11 menu launcher - dmenu alternative in <250 lines of C"
arch=('x86_64')
url="https://github.com/tinyopsec/tmenu"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd tmenu-main
  make
}

package() {
  cd tmenu-main
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
