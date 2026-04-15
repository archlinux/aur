pkgname=tmenu
pkgver=1.1
pkgrel=3
pkgdesc="Minimal X11 menu launcher - dmenu alternative in <250 lines of C"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'riscv64')
url="https://github.com/tinyopsec/tmenu"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/tmenu-main"
  make
}

package() {
  cd "$srcdir/tmenu-main"
  install -Dm755 tmenu "$pkgdir/usr/bin/tmenu"
}
