# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=mts-utils
pkgver=2.0.3
pkgrel=1
pkgdesc='MPEG Transport Stream Utilities (tstools fork, includes tsplay)'
arch=(x86_64)
url='https://github.com/xyproto/mts-utils'
license=(MPL)
makedepends=('cxx>=3.0.5' git)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
  make -C "$pkgname"
}

check() {
  make -C "$pkgname" check
}

package() {
  PREFIX=/usr DESTDIR="$pkgdir" make -C "$pkgname" install
}

# vim: ts=2 sw=2 et:
