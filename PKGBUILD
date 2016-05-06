pkgname=nsnotifyd
pkgver=1.6
_commit=1b469eceb83f811e3f22a164b8713c1fb307f0f0
pkgrel=1
pkgdesc="DNS NOTIFY message handler"
arch=(i686 x86_64)
url="http://dotat.at/prog/nsnotifyd/"
license=(custom:CC0)
provides=(metazone=$pkgver)
source=("git+https://github.com/fanf2/nsnotifyd.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  sed -i '/^CFLAGS/d' Makefile.in
  ./configure
  make prefix=/usr
}

package() {
  cd "$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
