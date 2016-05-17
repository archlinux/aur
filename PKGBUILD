# Maintainer: <grawity@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>

pkgname=nocache
pkgver=1.0
pkgrel=1
pkgdesc="minimize caching effects"
arch=(i686 x86_64)
url="https://github.com/Feh/nocache"
license=('FreeBSD License')
source=("git+https://github.com/Feh/nocache.git#tag=v1.0")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
