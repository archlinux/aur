pkgname=sind-git
pkgrel=1
pkgver=r21.aeecca0
provides=(sind)
pkgdesc='Simple Notification Daemon. Prints freedesktop notifications to stdout'
url=https://github.com/htylo/simplenotifydaemon
makedepends=(git)
source=("${pkgname}::git+https://github.com/htylo/simplenotifydaemon")
arch=(any)
options=(!strip)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}
