# Maintainer: bogdanbtw <https://github.com/bogdanbtw>
pkgname=zenithwm-git
pkgver=0.1.r1.20f7e5b
pkgrel=1
pkgdesc="Minimal and Unbloat Tiling WM written in C"
arch=('x86_64')
url="https://github.com/bogdanbtw/zenithwm"
license=('MIT')
depends=('libx11')
makedepends=('git' 'gcc' 'make')
provides=('zenithwm')
conflicts=('zenithwm')
source=('git+https://github.com/bogdanbtw/zenithwm.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
