# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=mts-utils
pkgver=3.1.0
pkgrel=1
pkgdesc='MPEG Transport Stream Utilities (tstools fork, includes tsplay)'
arch=(x86_64)
url='https://github.com/xyproto/mts-utils'
license=(MPL)
makedepends=(git parallel slay)
source=("git+$url#tag=$pkgver")
b2sums=('a0fcd7a7aa316b4f4e89aec06fdd4c0b2346298f045b37feb5ed55e5693732bfd82dd20f8165ef22d7b838be930eec87d8210369cf62d9b3ae89be93d7de320e')

build() {
  make -C "$pkgname"
}

#check() {
#  make -s -C "$pkgname" test
#}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname" install
}
