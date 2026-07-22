# Maintainer: Ben Woods <archlinux@ben.woods.am>
pkgname=redwax-tool
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal certificate conversion tool"
arch=('x86_64')
url="https://redwax.eu/rt/"
license=('Apache-2.0')
depends=(
  apr
  apr-util
  glibc
)
makedepends=()
source=("https://redwax.eu/dist/rt/${pkgname}-${pkgver}.tar.gz")
sha256sums=('28856bd059c299952ec5e9d70af0252f1415409e579dd0227556a219ebc43683')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
