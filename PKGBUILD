# Maintainer: Tuomas Siipola <siiptuo at kapsi dot fi>
pkgname=lumeus-git
pkgdesc='adjust backlight brightness'
pkgver=r10.d03388f
pkgrel=1
arch=('any')
url='https://github.com/siiptuo/lumeus'
license=('MIT')
makedepends=('git')
source=('git+https://github.com/siiptuo/lumeus.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
