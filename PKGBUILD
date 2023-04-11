# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=wev
pkgver=1.0.0
pkgrel=10
pkgdesc="tool for debugging wayland events, similar to xev"
url='https://git.sr.ht/~sircmpwn/wev'
license=(MIT)
arch=('i686' 'x86_64' 'aarch64')
depends=('wayland' 'libxkbcommon')
makedepends=('git' 'scdoc' 'wayland-protocols')
conflicts=('wev-git')
source=(git+https://git.sr.ht/~sircmpwn/wev#tag=$pkgver)

build() {
  cd "$pkgname"
  make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP')
