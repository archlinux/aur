# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=lisp
pkgver=1.2.0
pkgrel=1
pkgdesc='Wrapper scripts for SBCL, for programming in Common Lisp'
arch=(any)
url='https://github.com/xyproto/lisp'
license=(GPL2)
depends=(sbcl)
makedepends=(git)
source=("git+$url#tag=$pkgver")
sha256sums=(SKIP)

check() {
  getent passwd "$USER" | cut -d: -f5 | make -C $pkgname test
}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname" install
}

# vim: ts=2 sw=2 et:

