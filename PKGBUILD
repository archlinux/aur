# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=webkit2-sharp
pkgver=2.10.9
pkgrel=2
pkgdesc="C Sharp bindings for WebKit 2 with GTK+ 3"
arch=(x86_64)
url="https://github.com/hbons/webkit2-sharp"
license=(MIT)
depends=(gtk-sharp-3 webkit2gtk)
makedepends=(git libxslt)
_commit=dec1e10876f3bbda621f635937c23ac486cd6e05  # master
source=("git+https://github.com/hbons/webkit2-sharp#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
