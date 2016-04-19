# Maintainer: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=pxz-git
pkgver=r56.fcfea93
pkgrel=1
pkgdesc="Runs LZMA compression of different parts of an input file on multiple cores and processors simultaneously"
arch=('x86_64')
url="http://jnovy.fedorapeople.org/pxz/"
license=('GPL2')
makedepends=('git')
depends=('xz')
source=('git+https://github.com/jnovy/pxz.git')
md5sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

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

  make DESTDIR="$pkgdir" install
}
