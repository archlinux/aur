# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=webkit2-sharp
pkgver=2.10.9
_gitrev=dec1e10876f3bbda621f635937c23ac486cd6e05
pkgrel=1
pkgdesc="C Sharp bindings for WebKit 2 with GTK+ 3"
arch=('i686' 'x86_64')
url="https://github.com/hbons/webkit2-sharp"
license=('MIT')
depends=('gtk-sharp-3' 'webkit2gtk')
makedepends=('libxslt')
source=("$pkgname-$_gitrev.tar.gz::https://codeload.github.com/hbons/$pkgname/tar.gz/$_gitrev")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$_gitrev"
  ./autogen.sh --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$_gitrev"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
