# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=lisp
pkgver=1.2.0
pkgrel=2
pkgdesc='Wrapper scripts to make it easier to get started with Common Lisp'
arch=(any)
url='https://github.com/xyproto/lisp'
license=(GPL2)
depends=(sbcl)
makedepends=(git)
source=("git+$url#commit=445ef31a19a5153f5c12099c3db61689212f85eb") # tag: 1.2.0
sha256sums=('SKIP')

check() {
  echo "$LOGNAME" | make -C $pkgname test
}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname" install
}
