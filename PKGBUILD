# Maintainer: <grawity@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>

pkgname=nocache
pkgver=1.0.r7.ge4e77a4
pkgrel=1
pkgdesc="minimize caching effects"
arch=(i686 x86_64)
url="https://github.com/Feh/nocache"
license=('FreeBSD License')
_commit=e4e77a48528739188dccbdbd8b4d2d2d49aa0d99
source=("git+https://github.com/Feh/nocache.git#commit=$_commit")
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
