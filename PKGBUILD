# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=mts-utils
pkgver=3.1.1
pkgrel=1
pkgdesc='MPEG Transport Stream Utilities (tstools fork, includes tsplay)'
arch=(x86_64)
url='https://github.com/xyproto/mts-utils'
license=(MPL)
makedepends=(git parallel slay)
source=("git+$url#tag=v$pkgver")
b2sums=('96cd2dbcfa5df08c22b4a46b919595775c4f4d670dcb62aacf946e586d7c71c5650c0bbfd7ab0105a5b2375841cae7656555a616bad9130f9a25bd78a075b3ab')

build() {
  make -C "$pkgname"
}

check() {
  make -s -C "$pkgname" test
}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname" install
}
